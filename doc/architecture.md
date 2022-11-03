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

Account structure  

<div align="center">
	<p>
		<img alt="account strategy" src="https://github.com/ThoughtWorks-DPS/lab-documentation/blob/main/doc/aws_account_strategy.png" />
	</p>
</div>

The `state` account is a dedicated account within which machine-users and non-federated platform delivery team members, groups, and group memberships are defined. Why do we define this things in this one account?

There are two central drivers behind this configuration; stability and security.  

_Stability._ We will be using IAM roles as the mechanisms by which any kind of user (hunan or machine) gains permissions to do anything within these AWS accounts. Each role will be tailered to the specific requirements of the job it performs. And, from our architectural guiding princples, there is one definition of our platform product. In other words; every environment is like prod. And, as part of that, every account is configured like a production account. In the case of IAM roles, this means that our collection of roles will be identical in every account. Which indentity can assume which role - that may be different between accounts.  

The state account is also often used as an aggregation location for security audit log and other cross-account data that needs to be funneled into longer-term systems of record.  

The `sandbox` account is used only by the DI Platform product team. This account is where the continuous integration and testing of platform infrastructure and services takes place, prior to deployment in customer facing accounts.  

All customer, non-production workloads live in the `nonprod` account.  

The `prod` account is for customer production workloads and for the custom, platform capability APIs.  

#### 1.4.2 Distributed Compute Foundations

**Initial build pipelines diagram**

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

**1.4.3.1 Initial Multi-team**  
**1.4.3.1 Scaled**

#### 1.4.4 Architectural Decision Record

We will be going back and gathering the historical ADRs [here](/doc/architectural_decisions/). Individual repositories may also contain their own Decision Records. Once in place this will become the ongoing source for such records.  
