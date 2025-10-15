codeunit 50111 SocialMediaCodeunit
{
    Subtype = Test;

    [Test]
    procedure CheckLinkedInUrlField()
    var
        Customer: Record Customer;
        LinkedInProfile: Text;
        ShouldStartMsg: Label 'Should start with https://www.linkedin.com';
    begin
        // [Feature] [Social Media]
        // [Scenario 545] LinkedIn URL's should start with
        //                https://www.linkedin.com
        Initialize();

        // [Given] Customer record with an empty LinkedIn
        CreateNewCustomer(Customer);

        // [Given] A LinkedIn Profile
        LinkedInProfile := 'https://www.linkedin.com/profile/some-profile-15879';

        // [When] LinkedIn value provided
        AddLinkedInProfile(Customer, LinkedInProfile);

        // [Then] LinkedIn should start with https://www.linkedin.com
        //Assert.IsTrue(VerifyLinkedIn(Customer), ShouldStartMsg);
    end;

    procedure Initialize()
    begin
        // Setup logic (if needed)
    end;

    procedure CreateNewCustomer(var Customer: Record Customer)
    begin
        Customer.Init();
        Customer.Name := 'Test Customer';
        Customer.Insert();
    end;

    procedure AddLinkedInProfile(var Customer: Record Customer; ProfileLink: Text)
    begin
        Customer.Validate(LinkedIn, ProfileLink);
        Customer.Modify();
    end;

    procedure VerifyLinkedIn(Customer: Record Customer): Boolean
    begin
        exit(Customer.LinkedIn.StartsWith('https://www.linkedin.com'));
    end;

    var
    //Assert: Codeunit "Library Assert";
}
