tableextension 50111 CustomerExtLinkedIn extends Customer
{
    fields
    {
        field(50100; LinkedIn; Text[250])
        {
            Caption = 'LinkedIn';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                InvalidUrlErr: Label 'The LinkedIn URL must start with "https://www.linkedin.com".';
            begin
                if not (CopyStr(LinkedIn, 1, 26) = 'https://www.linkedin.com') then
                    Error(InvalidUrlErr);
            end;
        }
    }
}
