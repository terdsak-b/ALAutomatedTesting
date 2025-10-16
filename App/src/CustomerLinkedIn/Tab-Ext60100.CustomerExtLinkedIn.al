tableextension 60100 CustomerExtLinkedIn extends Customer
{
    fields
    {
        field(50111; LinkedIn; Text[250])
        {
            Caption = 'LinkedIn';
            DataClassification = CustomerContent;

            // trigger OnValidate()
            // var
            //     InvalidUrlErr: Label 'The LinkedIn URL must start with "https://www.linkedin.com".';
            // begin
            //     if not LinkedIn.StartsWith('https://www.linkedin.com') then
            //         Error(InvalidUrlErr);
            // end;
        }
    }
}
