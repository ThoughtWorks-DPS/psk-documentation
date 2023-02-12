<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/>
	</p>
  <h3>1.4 Architecture</h3>
</div>
<br />

![bootstrap](https://img.shields.io/badge/document-EarlyDraft-yellow.svg?style=for-the-badge&logo=markdown)  


#### 1.4.1 Account Structures

Initial Platform product launch and development account structures. Accounts in this case refer to the cloud vendors natural configuration isolation boundaries. In the case of AWS, these are Accounts, for Google Cloud these can be Projects, and so on.  

<div align="center">
	<p>
		<img alt="account strategy" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/lab-documentation/master/doc/img/1_architecture" />
	</p>
</div>

The `state` account is a dedicated account within which machine-users and non-federated platform delivery team members, groups, and group memberships are defined. Why do we define these things in this one account?

There are two central drivers behind this configuration; stability and security.  

_Stability._ We will be using IAM roles as the mechanisms by which any kind of user (DI team member or machine) gains permissions to do anything within these AWS accounts. Each role will be tailered to the specific requirements of the job it performs. And (from our [architectural guiding princples](concepts.md)) there is one definition of our platform product. In other words; every environment is like prod, and by extension, every account is configured like a production account.  

In the case of IAM roles, this means that our collection of roles will be identical in every account. Which identity can assume which role - that may be different between accounts. For example, we will define a nonprod machine user (also called a service account identity) and a prod machine user. While the prod service account can assume roles across all accounts, the nonprod service account cannot assume any roles in a production account. But regardless of how many and what kinds of roles are defined, you can rely upon the appropriate user having the role identically available in any account managed within the Platforom product domain.  

Implementing and adhereing to this pattern reduces complexity and has the effect of constraining role-related complexity across the domain.  

_Security._ The actual IAM identities of both the service accounts and the DI team members do not have aws permissions, except the permission to assume a role. Assuming a role means the user is issued short-lived credentials to be used for actually performing the desired change.  

Note from earlier sessions on secrets management and pipelines, the architecture actively constrains the number of places where these service account credentials even exist. The aws service accounts credentials are stored in the platform secrets store during automated creation and are not stored or maintained anywhere else. When a pipeline needs to use the service account credentials to request a short-lived tokens to perform changes, they are fetched from the store at run time to live only briefly in the ephemeral pipeline executor memory.  

DI platform product team members must also assume roles to gain actual permissions. It is quite common for the live-users identity within AWS to be established via federation with a companies authoritative identity source. But where that is not the case, aws IAM identities will be created for them.  

Neither human users nor machine user identities are directly assigned any sort of permissions and are placed into Groups that manage the roles they can assume across the related accounts.  

This collection of groups, roles, permissions, and service accounts is an identified, single subdomain within the larger DI platform domain.  

When launching a new DI platform product, EMPC highly recommends that a single team own the entire product domain and delivery through the initial generally available release. At which point, based on the needs of scale or velocity, it becomes valuable to begin building new domain teams around subdomains from the overall platform domain. However, the iam profiles domain elements remain tightly coupled and should always be owned by a single team. When new domain teams within the DI platform are formed, a pre-requisite will be the delivery of a self-serve means of all such DI-product teams to manage these iam profile elements.    

(The state account is also often used as an aggregation location for security audit log and other cross-account data that needs to be funneled into longer-term systems of record.)  

The `sandbox` account is used only by the DI Platform product team. This account is where the continuous integration and testing of platform infrastructure and certain services takes place, prior to deployment in customer facing accounts.  

**Note.** From the perspective of the DI platform product, if customers of the platform will be using services or deploying things somewhere in the account, it is considered Production. While development teams using a DI platform will create and maintain non-production environments for their own purposes, the DI product needs to consider all such as production. AWS treats it's product offerings in this same way. I may create things in AWS that I consider nonprod or development, but that is essentially irrelevant from Amazon's point of view.  

All customer, non-production workloads live in the `nonprod` account.  

The `prod` account is for customer production workloads and for the custom, platform capability APIs used by customers.  

#### 1.4.2 Distributed Compute Foundations

**Initial build pipelines diagram for baseline platform components**

<div align="center">
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/lab-documentation/master/doc/img/platform_build_diagram.png?sanitize=true" width=1150/>
</div>

<div align="center">
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/lab-documentation/master/doc/img/distributed_compute_foundation.png?sanitize=true" width=1150/>
</div>

#### 1.4.3 Delivery Infrastructure (or Engineering) Platform domain boundaries

**1.4.3.1 MVP**

<div align="center">
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/lab-documentation/master/doc/img/mvp.png?sanitize=true" width=1150/>
</div>

**1.4.3.1 Initial Multi-team** (pending)  
**1.4.3.1 Scaled** (pending)  

#### 1.4.4 Architectural Decision Record

We will be going back and gathering the historical ADRs [here](/doc/architectural_decisions/). Individual repositories may also contain their own Decision Records. Once in place this will become the ongoing source for such records.  

<hr>  

[<kbd> <br> Home <br> </kbd>](../README.md)
