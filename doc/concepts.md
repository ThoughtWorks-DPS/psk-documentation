<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/>
	</p>
  <h3>1.1 Concepts</h3>
</div>
<br />

![bootstrap](https://img.shields.io/badge/document-EarlyDraft-yellow.svg?style=for-the-badge&logo=markdown)  

#### 1.1.1 Modern Engineering Platforms

The EMPC labs' OSS resources are related to building a modern engineering platform, consumed by internal customers, providing an independently useable, product experience. In the past we have also called these as Delivery Infrastructure products.  

We refer to these resources collectively as **Platform Starter Kits**.

> An Engineer Platform is “a foundation of self-service APIs, tools, services, knowledge, and support which are arranged as a compelling internal product. Autonomous delivery teams can make use of the platform to deliver product features at a higher pace, with reduced coordination.” - Evan Bottcher 

#### 1.1.2 Product Experience

_Product Experience_ refers to a high-quality, self-serve, consumer experience when using platform capabilities. 

This is analogous to the experience we've come to expect from the many SaaS providers now offering developer tools.  

Let's use GitHub as an example. In a well-implemented enterprise adoption of GitGub, as a Developer, knowing the url of the company's organization, I expect to be able to login using my company SSO credentials. I expect that I can interact with git services on-demand, using as much `git` as I need, whenever I need it. I can readily create repos, edit code, delete repos, and in general do all the git-things without needing to ask someone else to do these necessary things on my behalf. I can use the git cli, or I can use the UI wherever it makes sense for my tasks. And I expect to be able to directly call the github API to fully automate whatever behavior I find valuable. If I have to call someone at GitHub, or open a ticket, it should only be when something is broken on their end. And I also expect GitHub to be actively developing the product. As a valued customer, I want to be able to submit feature requests and otherwise influence the product roadmap. But from the start, the functionality available offers significant value and in those places where I wish it could do more - I can adopt my own work-arounds. There is adequaete documentation (text, video, etc) such that it is completely reasonable to expect that I can discover and make full use of GitHub in an independent and self-directed manner.  

This is the kind of `product` experience that goes into delivering an Engineering Platform.  

Providing a product experience means removing the organizational lead-time planning and engineering friction normally associated with deploying and managing software. 

What do we mean by _lead-time planning and engineering friction_? 

**Lead-Time Planning** 

When a development team, in the course of creating and delivering business capabilities and customer experiences, must coordinate their own delivery needs with other functional technology teams, this requires engaging in lead-time planning activities to prevent being blocked. 

Typical examples may include needing to schedule-ahead requests with: 
* an IAM Team - to create a machine account or custom roles so I can access and customize technologies.
* a DNS Team - to create DNS entries needed by my service
* an SSO team - to gain access to each of the various, standard developer resources such as git repositories, pipeline tools, or static code analysis tools. Or to coordinate accurate RBAC within such tools for myself or my team. 
* a separate DevOps team - to make changes to my pipeline, request additional compute resources, gain access to a production environment during an outage or direct members of the DevOps to perform outage responses on my behalf. 
* a Monitoring team - to gain access to infrequently used logs or metrics or to request the creation of monitors, alerts, or dashboards. 

And this is definitely the shortest of lists. 

A dev team will collectively spend significat hours trying to get needed changes scheduled ahead of the dependent stories, time taken away from delivering business value. As it is not possible to adequately anticipate everything before encountering the situationally specific need, nor predict how long these other teams may need to complete such tasks therefore work is routinely blocked. Yet, organizations are under tremendous delivery pressure and set aggressive delivery dates around backlogs running months and even years into the future. The result is not only blocked stories pilling up across team backlogs, but also teams are continuously re-prioritizing work based not on value but on which stories are not blocked this sprint.  

_Note. The inter-team dependencies in focus here are not the coordination needs that arise from creating multiple business services and capabilities that may have interdependent outcome goals. While poorly managed domain boundaries amongst business capability teams are also a source of planning challenges and friction, it is the traditional IT and technology silos that are at the heart of engineering platform products._

**Engineering Friction** 

Engineering friction is the ubiquitous result of the batch-and-queue assembly line operating model that result from establishing functional 'IT Service' silos. These functional teams are staffed to maintain 100% utilization resulting in widely variable cycle time, reduced quality, and overall increased risk[^1]. 

Multiple interactions with many such teams increase the communication challenges, additionally contributing to the variable cycle times and frequent re-work.  

#### 1.1.3 Use of SaaS versus Self-Managed capabilities  

Throughout the Platform Starter Kit, you will see extensive use of SaaS-based development tools and IaaS providers. This is intentional and recommended. 

While necessary for delivering high-quality customer experiences in software, none of the tools and technologies used in the development, release, operation, and maintenance of software are themselves strategic differentiators. 

Organizations routinely under estimate the cost of self-managing COTS, development-related services in particular, even going so far as to use poorly-suited but familiar tools like Jenkins. I.e., it is frequently the case that an honest and realistic assessment of actual cost reveals self-managed Jenkins as the most expensive component in a dev toolchain. 

Using secure and well-architected SaaS development tools is consistently one of the most accelerating and cost-saving strategies available. And not only during the implementation phase but over the entire life of the platform. 

Even if you have the financial resources to comfortably afford the increased costs of self-managed development and maintenance of non-differentiated capabilities, the opportunity cost alone negates any perceived value and cannot be recovered later through additional investment. Invest in creating and maintaining the capabilities that are your company's strategic differentiators amongst the competition. New business building is a defining characteristic of digitally successful companies. 

#### 1.1.4 Evolutionary Architecture and agility

Friction, rigidity, and instability are the results of organizational and architectural decisions. People often assume architecture is intrinsically hard to change. But what if we design and architect systems to be capable (affordable, timely) of continuous incremental change over time? 

> An evolutionary architecture supports guided, incremental change as a first principle across multiple dimensions[^2].

**Adopt** 

* Evolutionary architecture as a foundational practice.
* Commit to architecture decisions only after comparative experimentation and based on outcomes of working implementations for real development deliverables.
* Suitability to IaC lifecycle and domain-bounded implementation is a prerequisite for all tools and technologies.
* Apply software lifecycle practice to infrastructure code, e.g., test-driven development, continuous integration, pipelines
* Rigorously architect dimensions for change both in the selection of tools and technologies as well as in their implementation, e.g., use small or narrowly focused tools that are excellent at one thing and inter-operate easily (loosely copuled) with other technologies rather than all-in-one products that attempt to do many different things. Have ease of replacement in mind.
* Access to infrastructure is self-serve and on-demand. Either a development team self-manages their own infrastructure, or dedicated infrastructure teams deliver a self-serve interface to development teams.

**Avoid** 

* Required use of pre-defined solutions regardless of architectural suitability, e.g., must use self-managed technologies from a single vendor (we are an Oracle shop), all development must be in the same programming language (only Java permitted).
* Purchasing or otherwise committing to architectural solutions based solely on website documentation or sales-engineering assurances
* Functionally isolating technology or tool decisions away from the primary users or implementors.

#### 1.1.5 A Definition of Software Defined

Software Defined Infrastructure means:  
Use of modern SDLC practices and infrastructure frameworks in the continuous integration and delivery of systems that are resilient, secure, observable, and capable of change at scale.  

| Software Defined | vs | Not Quite |
|------------------|----|-----------|
| Entire Infrastructure deployed using diffable, versioned source Code and 3rd party artifacts| | Varying amounts of manual configuration |
| Engineered “as software” (evolutionary, tdd, dry, static code analysis, …) | | Engineered mechanically (attempt to pre-architect for all possible outcomes, copy/paste scripts between environments, human inspection for correctness) |
| Orchestrated by domain bounded, heterogeneous pipelines | | Varying amounts of manual orchestration, monolithic infrastructure code |
| Resiliency, security, observability are an attribute of every domain | | DR and monitoring are functionally siloed and optimized, security added on after the fact |

#### 1.1.6 Guiding Principals of Platform Product Architectures

<br />
<div align="center">
  <h4>Platform Manifesto</h4>
  <p>• There is one platform, not a collection of platforms •</p>
  <p>• The desired state of the platform is a known quantity •</p>
  <p>• The desired state is machine parseable •</p>
  <p>• The only authoritative source for the actual state of the platform is the platform •</p>
  <p>• The actual state must self-correct to the desired state •</p>
  <p>• The entire platform is deployable using diffable source code and 3rd party artifacts •</p>
  <p>• Test don’t inspect •</p>
  <p>• Convention rather than configuration •</p>
  </p>
  <br />
  <p>
  <p>_translation_</p>
  <p>(Every environment is like production)</p>
  <p>(Every detail of the desired state is documented)</p>
  <p>(The "desired state" is part of or consumable by the source-code for the software-defined delivery of the platform )</p>
  <p>(Avoid monitoring only proxies of state wherever possible)</p>
  <p>(The platform architecture is based on resiliency, not just availability)</p>
  <p>(It is software-defined, employing sdlc practices, not merely automated)</p>
  <p>(No dependencies on human inspection either to determine or validate state)</p>
  <p>(Naming is not merely an identifier but aims to be derivable from knowing the product, environment, component, etc)</p>
</div>
<br />
<br />

[^1]: Donald G. Reinertsen, "Managing Queues," in _The Principles of Product Development Flow, Second Generation, Lean Product Development_ (Redondo Beach, California: Celeritas Publishing, 2009). The entire book is an excellent treatise on the effects of legacy batch-and-queue processes on the software development lifecycle. 

[^2]: Neal Ford, Rebecca Parsons, Patrick Kua, _Building Evolutionary Architectures_ (O'Reilly Media, Inc, 2017), 5. 

<hr>  

[<kbd> <br> Home <br> </kbd>](../README.md)
