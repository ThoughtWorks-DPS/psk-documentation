<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/>
	</p>
  <h3>1.4.1 Account Structures</h3>
</div>
<br />

![bootstrap](https://img.shields.io/badge/document-EarlyDraft-yellow.svg?style=for-the-badge&logo=markdown)  

Accounts in this case refer to the cloud vendors natural configuration isolation boundaries. In the case of AWS, these are Accounts, for Google Cloud these can be Projects, and so on. Accounts associated with a particular product exist within the larger organizational structure of the Enterprise.  

For example, in AWS the top-level organizational-unit structure for an Enterprise is typically created according to the following structure:  

<div align="center">
	<p>
		<img alt="account strategy" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/lab-documentation/master/doc/img/org_ou_structure.png" />
	</p>
</div>

Within these OUs then, accounts are created for the various business domains:  
<div align="center">
	<p>
		<img alt="account strategy" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/lab-documentation/master/doc/img/org_account_structure.png" />
	</p>
</div>

As shown in the above account-structure diagram, individual product accounts hopefully form a subset of a well-architectured organizational structure. The PSK focus only an activities within the EP product accounts.  

<div align="center">
	<p>
		<img alt="account strategy" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/lab-documentation/master/doc/img/architecture1.png" />
	</p>
</div>

The `state` account is a dedicated account within which service accounts (machine-users, and if any, non-federated platform delivery team members), groups, and group memberships are defined.  

Why do we define service accounts and related group memberships in this one account?

There are two central drivers behind this configuration; stability and security.  

_Stability._ We will be using IAM roles as the mechanisms by which any kind of user (EP team member or machine) gains permissions to do anything within these AWS accounts. Each role will be tailered to the specific requirements of the job it performs. And (from our [architectural guiding princples](concepts.md)) there is one definition of our platform product. In other words; every environment is like prod, and by extension, every account is configured like a production account.  

In the case of IAM roles, this means that our collection of service-account infrastructure roles will be identical in every account. Which identity can assume which role - that may be different between accounts. For example, we will define a nonprod service account and a prod service account. While the prod service account can assume roles across all accounts, the nonprod service account cannot assume any roles in a production account. But regardless of how many and what kinds of roles are defined, you can rely upon the appropriate user having the role identically available in any account managed within the Platforom product domain.  

Applications running on the engineering platform that need access to other AWS service will also use roles; oidc-assumable roles which are created and managed elsewhere.   

Implementing and adhereing to this pattern has the effect of constraining role-related complexity across each domain.  

_Security._ The actual IAM identities of both the service accounts and the EP team members do not have aws permissions, except the permission to assume a role. Assuming a role means the machine-user is issued short-lived credentials to be used for actually performing the desired change.  

This architecture actively constrains the number of places where these service account credentials even exist. The aws service accounts credentials are stored in the platform secrets store during automated creation and are not stored or maintained anywhere else. When a pipeline needs to use the service account credentials to request a short-lived tokens to perform changes, they are fetched from the store at run time to live only briefly in the ephemeral pipeline executor memory.  

Engineering Platform product team members must also assume roles to gain actual permissions. It is quite common for the live-users identity within AWS to be established via federation with a companies authoritative identity source. But where that is not the case, aws IAM identities will be created for them.  

Neither human users nor service account identities are directly assigned any sort of permissions and are placed into Groups that manage the roles they can assume across the related accounts.  

This collection of groups, roles, permissions, and service accounts is an identified, single subdomain within the larger engineering platform domain.  

When launching a new engineering platform product, EMPC highly recommends that a single team own the entire product domain and delivery through the initial generally-available release. At which point, based on the needs of scale or velocity, it becomes valuable to begin building new domain teams around subdomains from the overall platform domain. However, the iam profiles domain elements remain tightly coupled and should always be owned by a single team. When new domain teams within the engineering platform are formed, a pre-requisite will be the delivery of a self-serve means of all such EP-product teams to manage these iam profile elements.    

(The state account is also often used as an aggregation location for security audit log and other cross-account data that needs to be funneled into longer-term systems of record.)  

The `development` account is used only by the EP Platform product team. This account is where the continuous integration and testing of platform infrastructure and cluster services takes place, prior to deployment in customer facing accounts.  

**Note.** From the perspective of the engineering platform product, where customers of the platform use services or deploy things is considered Production. While development teams using a engineering platform will create and maintain non-production environments for their own purposes, the EP product needs to consider all such as production. AWS treats it's product offerings in this same way. I may create things in AWS that I consider nonprod or development, but that is essentially irrelevant from Amazon's point of view.  

All customer, non-production workloads live in the `non-production` account.  

The `production` account is for customer production workloads and for the custom, general platform capability APIs used by customers.  

Within the EPMC Platform Starter Kit working examples, this overall structure has been demonstrated while limited to just two accounts for cost purposes.  


[<kbd> <br> Home <br> </kbd>](architecture.md)
