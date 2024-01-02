Using Combine

dataService.passThroughpublisher
1. Sequence Operations
2. Mathematic Operations
3. Filter / Reducing Operations
4. Timing Operations
5. Multiple Publisher / Subscribers

Dive deeper into Combine:
https://heckj.github.io/swiftui-notes/

Using Combine 
@ Joseph Heck - Version 1.2.2, 2022-05-24
========================================================================================================================================
`````````````ruby
<img width="1011" alt="About a book" src="https://github.com/Elaidzha1940/ImprovedCombine/assets/64445918/8b980ab5-3b51-4f88-9106-bbc351fdfd11">

Publisher and Subscriber:
========================================================================================================================================

<img width="1050" alt="Publisher and Subscriber" src="https://github.com/Elaidzha1940/ImprovedCombine/assets/64445918/c6c620eb-76b9-46eb-9db1-ca3e4eb170a6">

Lifecycle of Publisher and Subscribers: 
========================================================================================================================================

<img width="1002" alt="Lifecycle of Publisher and Subscribers" src="https://github.com/Elaidzha1940/ImprovedCombine/assets/64445918/5f46bfb2-2683-41a5-85b9-b86e8df4acc4">

Publisher and subscribers are meant to be connected, and make up the core of Combine
=========================================================================================================================================

<img width="1002" alt="1" src="https://github.com/Elaidzha1940/ImprovedCombine/assets/64445918/53d36d52-8899-401a-ac94-e8f68c09a63f">

You can create chains of these together, for proccessing, reacting, and transforming the data privided by a publisher, and requested by the subscriber
========================================================================================================================================

<img width="1004" alt="2" src="https://github.com/Elaidzha1940/ImprovedCombine/assets/64445918/15266a5c-d908-49bf-b180-eafdb52fa75d">

A simple Combine pipeline written in swift might look like:
========================================================================================================================================

<img width="1019" alt="pipeline" src="https://github.com/Elaidzha1940/ImprovedCombine/assets/64445918/953521be-d3f8-4f8e-a6f1-b9e32f2dbbc9">

`````````````
