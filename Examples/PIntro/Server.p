/*************************************************************
Server receives eRequest event from the client and performs
local computation.  Based on the local computation, server
responds with either eReqSuccessful or eReqFailed.  Server
responds to requests in the order in which they were received.
*************************************************************/

machine ServerMachine
{
  var helper: machine;
  var client: machine;
  var reqId: int;
  start state Init {
    entry {
      helper = new HelperMachine(this);
      goto WaitForRequests;
    }
  }

  state WaitForRequests {
    on eRequest do (payload: requestType){
      client = payload.source;
      reqId = payload.id;
      send helper, eProcessReq, (id = payload.id, val = payload.val);
      goto GetResponseFromHelper;
    }
  }

  state GetResponseFromHelper {
    defer eRequest;
    on eReqSuccessful do {
      send client, eResponse, (id = reqId, success = true);
      goto WaitForRequests;
    }

    on eReqFailed do {
      send client, eResponse, (id = reqId, success = false);
      goto WaitForRequests;
    }
  }
}

/***************************************************************
The helper machine performs some complex computation and returns
either eReqSuccessful or eReqFailed.
****************************************************************/
machine HelperMachine
sends eReqSuccessful, eReqFailed;
{
  var server: machine;
  
  start state Init {
    entry(payload : machine){
      server = payload;
    }
    on eProcessReq do {
      if($) //non-deterministic choice modeling error
      {
        send server, eReqSuccessful;
      }
      else
      {
        send server, eReqFailed;
      }
    }
  }
}
