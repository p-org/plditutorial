module ClientModule = { ClientInterface -> ClientMachine };

module ServerModule = { ServerClientInterface -> ServerMachine, HelperInterface -> HelperMachine
};

module AbstractServerModule = { ServerClientInterface -> AbstractServerMachine };

//Check that the composition of ClientModule and AbstractServerModule is safe.
test testcase0 [main = TestDriver0]: (compose { TestDriver0 }, 
    (assert ReqIdsAreMonotonicallyIncreasing, RespIdsAreMonotonicallyIncreasing in (compose ClientModule, AbstractServerModule)));

//Check that server abstraction is correct.
module TestDriver1 = (compose { TestDriver0 }, ClientModule);
test testcase1 [main = TestDriver0]: 
  (compose TestDriver1, ServerModule) 
  refines 
  (compose TestDriver1, AbstractServerModule);


//C code generation for the implementation.
implementation Final: (compose ClientModule, ServerModule);