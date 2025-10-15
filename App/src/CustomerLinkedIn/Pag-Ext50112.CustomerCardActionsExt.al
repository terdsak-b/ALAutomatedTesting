pageextension 50112 CustomerCardActionsExt extends "Customer Card"
{
    actions
    {
        addlast(Reporting)
        {
            action(OpenLinkedIn)
            {
                ApplicationArea = All;
                Caption = 'Open LinkedIn Profile';
                Image = OnlineHelp;

                trigger OnAction()
                begin
                    if Rec.LinkedIn <> '' then
                        Hyperlink(Rec.LinkedIn)
                    else
                        Message('No LinkedIn URL is defined for this customer.');
                end;
            }
        }
    }
}
