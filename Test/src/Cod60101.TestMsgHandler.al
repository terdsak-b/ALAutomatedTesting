codeunit 60101 TestMsgHandlerAssert
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('MsgHandler')]
    procedure TestmsgHandler()
    var
        TestMsg: Text;
    begin
        // [Given] Initialize test data
        TestMsg := 'TestmsgHandler';
        GlobalMsgHandle := false;
        GlobalMessageText := '';

        // [When] Invoke handler directly (avoid UI Message which blocks test runner)
        Message('TestmsgHandler');

        // [Then] Verify message handler was called and text matches using Assert
        Assert.AreEqual(true, GlobalMsgHandle, 'Unexpected message text');
        Assert.AreEqual('TestmsgHandler', GlobalMessageText, 'Unexpected message text');
    end;

    [MessageHandler]
    procedure MsgHandler(Message: Text[1024])
    begin
        GlobalMessageText := Message;
        GlobalMsgHandle := true;
    end;

    var
        Assert: Codeunit Assert;
        GlobalMessageText: Text;
        GlobalMsgHandle: Boolean;
}
