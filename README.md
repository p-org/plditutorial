# Safe Asynchronous Programming: Methodology, Language, and Tools

### Presenters:
- Pantazis Deligiannis (Microsoft)
- Ankush Desai (UC, Berkeley)
- Akash Lal (Microsoft)
- Shaz Qadeer (Facebook)

We will present a full-day tutorial on the P framework for programming safe asynchronous systems, such as device drivers [8], distributed systems [1, 2, 5], and autonomous robotics [3].
The methodology and tools have been used extensively in Microsoft for shipping Windows device drivers 
and Azure cloud services.

The tutorial is in five parts:

## Introduction	

This section will discuss Heisenbugs and introduce the overall programming methodology to attack them: 
(1) environment modeling, (2) safety and liveness specifications, (3) systematic testing as a search problem, 
(4) deterministic scheduler as a mechanism to implement systematic testing.  
	
## P Programming Language
	
This section will introduce the core P language including syntax and semantics of communicating state machines, 
event handlers, and specifications for safety and liveness properties.

## P# Runtime
	
This section will present P# [6], a role model for runtimes implementing P that provides:
(1) systematic testing, 
(2) efficient execution, 
(3) seamless interop with foreign code in .NET.
The presentation will also include an extension of P# for writing fault-tolerant cloud services.

## Algorithms for Systematic Testing of Asynchronous Event-Driven Programs

This section will present the core algorithms for systematic testing, including 
prioritized portfolio search using delaying explorers [7], randomized search, 
and detection of liveness violations [4]. 

## From Monolithic to Compositional Testing of Distributed Systems
	
This section will present a module system [2] motivated by the problem of soundly 
decomposing system-level monolithic testing problem into a collection of component-level testing problems.
The presentation will include both the theory of compositional refinement underlying the module system and its 
practical integration into the P language.

## Related Papers
[1] **Reliable State Machines: A Framework for Programming Reliable Cloud Services**.
Suvam Mukherjee, Nitin John Raj, Krishnan Govindraj, Pantazis Deligiannis, Chandramouleswaran Ravichandran, Akash Lal, Aseem Rastogi, and Raja Krishnaswamy.
European Conference on Object-Oriented Programming (ECOOP), 2019. 

[2] **[Compositional Programming and Testing of Dynamic Distributed Systems](http://people.eecs.berkeley.edu/~ankush/assets/papers/modp.pdf)**.
Ankush Desai, Amar Phanishayee, Shaz Qadeer, and Sanjit Seshia.
International Conference on Object-Oriented Programming, Systems, Languages, and Applications (OOPSLA), 2018.

[3] **[DRONA: A Framework for Safe Distributed Mobile Robotics](https://people.eecs.berkeley.edu/~ankush/Papers/drona.pdf)**.
Ankush Desai, Indranil Saha, Jianqiao Yang, Shaz Qadeer, and Sanjit A. Seshia.
In Proceedings of the 8th ACM/IEEE International Conference on Cyber-Physical Systems (ICCPS), 2017.

[4] **[Lasso Detection using Partial-State Caching](https://www.microsoft.com/en-us/research/publication/lasso-detection-using-partial-state-caching-2/)**. Rashmi Mudduluru, Pantazis Deligiannis, Ankush Desai, Akash Lal, Shaz Qadeer . In *Formal Methods in Computer-Aided Design* (FMCAD), 2017.

[5] **[Uncovering Bugs in Distributed Storage Systems During Testing (not in Production!)](https://www.usenix.org/node/194442)**. Pantazis Deligiannis, Matt McCutchen, Paul Thomson, Shuo Chen, Alastair F. Donaldson, John Erickson, Cheng Huang, Akash Lal, Rashmi Mudduluru, Shaz Qadeer and Wolfram Schulte. In the *14th USENIX Conference on File and Storage Technologies* (FAST), 2016.

[6] **[Asynchronous Programming, Analysis and Testing with State Machines](https://dl.acm.org/citation.cfm?id=2737996)**. Pantazis Deligiannis, Alastair F. Donaldson, Jeroen Ketema, Akash Lal and Paul Thomson. In the *36th Annual ACM SIGPLAN Conference on Programming Language Design and Implementation* (PLDI), 2015.

[7] **[Systematic Testing of Asynchronous Reactive Systems](http://people.eecs.berkeley.edu/~ankush/assets/papers/fse-desai.pdf)**.
Ankush Desai, Shaz Qadeer, and Sanjit A. Seshia.
In Proceedings of the 2015 10th Joint Meeting on Foundations of Software Engineering (ESEC/FSE 2015). 

[8] **[P: Safe asynchronous event-driven programming](http://people.eecs.berkeley.edu/~ankush/assets/papers/p.pdf)**.
Ankush Desai, Vivek Gupta, Ethan Jackson, Shaz Qadeer, Sriram Rajamani, and Damien Zufferey.
In Proceedings of ACM SIGPLAN Conference on Programming Language Design and Implementation (PLDI), 2013.
