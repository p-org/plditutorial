/**************************************************************************
Client sends multiple eRequest events to the server and waits for response.
Server responds with eResponse event for each eRequest event.
The responses must be in the same order as the requests being sent.
**************************************************************************/
event eAllResponsesReceived;

machine ClientMachine
{
  var server : machine;
  var nextReqId : int;
  var lastRecvSuccessfulReqId: int;
  var respRemaining : int;

  start state Init {
    entry (payload : machine)
    {
      nextReqId = 1;
      respRemaining = 0;
      server = payload;
      goto StartPumpingRequests;
    }
  }

  state StartPumpingRequests {
    entry {
      var index : int;
      //send 2 requests
      index = 0;
      while(index < 3)
      {
          send server, eRequest, (source = this, id = nextReqId, val = null);
          nextReqId = nextReqId + 1;
          respRemaining = respRemaining + 1;
          index = index + 1;
      }
    }
    
    // action (event-handler, does not change state)
    on eResponse do (payload: responseType){
        assert(payload.id > lastRecvSuccessfulReqId);
        lastRecvSuccessfulReqId = payload.id;
        respRemaining = respRemaining - 1;
        if(respRemaining == 0)
        {
          raise eAllResponsesReceived;
        }
    }

    // transition (changes the state)
    on eAllResponsesReceived goto StartPumpingRequests with {
      print "Done One Round";
    }

    exit {
        // the function gets executed when the machine exits the state
        // on an out-going transition.
      }
  }
}
