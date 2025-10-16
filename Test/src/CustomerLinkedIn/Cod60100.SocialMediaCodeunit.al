codeunit 60100 SocialMediaCodeunit
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
        LinkedInProfile := 'https://www.linkedin.com/in/testprofile';

        // [When] LinkedIn value provided
        AddLinkedInProfile(Customer, LinkedInProfile);

        // [Then] LinkedIn should start with https://www.linkedin.com
        Assert.IsFalse(Customer.LinkedIn = '', 'LinkedIn profile was not set');
        Assert.IsTrue(VerifyLinkedIn(Customer), ShouldStartMsg);
    end;

    procedure Initialize()
    begin

    end;

    procedure CreateNewCustomer(var Customer: Record Customer)
    begin

    end;

    procedure AddLinkedInProfile(var Customer: Record Customer; ProfileLink: Text)
    begin
        Customer.Validate(LinkedIn, ProfileLink);
    end;

    procedure VerifyLinkedIn(Customer: Record Customer): Boolean
    begin
        exit(Customer.LinkedIn.StartsWith('https://www.linkedin.com'));
    end;

    var
        Assert: Codeunit "Assert";

}