<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/>
	</p>
  <h3>x.x Amazon Web Services - Profile Guidance</h3>
</div>
<br />

![bootstrap](https://img.shields.io/badge/document-EarlyDraft-yellow.svg?style=for-the-badge&logo=markdown)  

# AWS Security Profile  

## AWS Specific Guidance  

* [Security Bulletins](https://aws.amazon.com/security/security-bulletins)
* [AWS Artifact](https://aws.amazon.com/artifact/)
* [AWS Well-Architected](https://aws.amazon.com/architecture/well-architected)  
* [EKS Best Practices Guides](https://aws.github.io/aws-eks-best-practices/)  
* [AWS Security Audit Guidelines](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-audit-guide.html)

## PSK Response  
### AWS Well-Architected\
#### Security  
##### Security Foundations  
###### SEC01-BP01 Separate workloads using accounts
###### SEC01-BP06 Automate testing and validation of security controls in pipelines
###### SEC01-BP07 Identify threats and prioritize mitigations using a threat model _(pending)_
##### Identity and Access Management  
###### Identity Management
####### SEC02-BP01 Use strong sign-in mechanisms
####### SEC02-BP02 Use temporary credentials
####### SEC02-BP03 Store and use secrets securely
####### SEC02-BP04 Rely on a centralized identity provider
####### SEC02-BP05 Audit and rotate credentials periodically
####### SEC02-BP06 Leverage user groups and attributes
###### Permission Management
####### SEC03-BP01 Define access requirements
####### SEC03-BP02 Grant least privilege access
####### SEC03-BP03 Establish emergency access process
####### SEC03-BP04 Reduce permissions continuously\
##### Detection
###### SEC04-BP01 Configure service and application logging
###### SEC04-BP02 Analyze logs, findings, and metrics centrally
###### SEC04-BP04 Implement actionable security events
##### Infrastructure Protection
###### Protecting Networks
####### SEC05-BP01 Create network layers
####### SEC05-BP02 Control traffic at all layers
####### SEC05-BP03 Automate network protection
get 'commented' version of Firewall Manager in front of cluster ingress
###### Protect Compute
####### SEC06-BP01 Perform vulnerability management
####### SEC06-BP02 Reduce attack surface
####### SEC06-BP03 Implement managed services
####### SEC06-BP04 Automate compute protection
####### SEC06-BP05 Enable people to perform actions at a distance
####### SEC06-BP06 Validate software integrity
##### Data Protection
###### Protecting Data at Rest
####### SEC08-BP01 Implement secure key management
####### SEC08-BP02 Enforce encryption at rest
####### SEC08-BP03 Automate data at rest protection
####### SEC08-BP04 Enforce access control
####### SEC08-BP05 Use mechanisms to keep people away from data
###### Protecting Data in Transit
####### SEC09-BP01 Implement secure key and certificate management
####### SEC09-BP02 Enforce encryption in transit
####### SEC09-BP04 Authenticate network communications

##### Incident Response  
###### Simulate
####### SEC10-BP07 Run game days
##### Application Security
###### SEC11-BP02 Automate testing throughout the development and release lifecycle
###### SEC11-BP05 Centralize services for packages and dependencies
OPA test for allowed registry, artifact stores, etc
###### SEC11-BP06 Deploy software programmatically
#### Reliability
##### Reliability Foundations
##### Workload Architecture
##### Change Management
##### Failure Management
### Performance Efficiency
#### Selection
##### Performance Architecture Selection
###### PERF01-BP04 Use policies or reference architectures
###### PERF01-BP05 Use guidance from your cloud provider or an appropriate partner
###### PERF01-BP06 Benchmark existing workloads
###### PERF01-BP07 Load test your workload
##### Compute Architecture Selection
###### PERF02-BP03 Collect compute-related metrics
###### PERF02-BP04 Determine the required configuration by right-sizing
###### PERF02-BP05 Use the available elasticity of resources
##### Network Architecture Selection
###### PERF05-BP01 Understand how networking impacts performance
###### PERF05-BP02 Evaluate available networking features
###### PERF05-BP04 Leverage load-balancing and encryption offloading
###### PERF05-BP06 Choose your workload’s location based on network requirements
#### Monitoring
##### Monitor your resources to ensure that they are performing as expected
###### PERF07-BP01 Record performance-related metrics
###### PERF07-BP03 Establish key performance indicators (KPIs) to measure workload performance
###### PERF07-BP04 Use monitoring to generate alarm-based notifications
###### PERF07-BP06 Monitor and alarm proactively

### Cost Optimization
#### Expenditure and Usage Awareness
##### Monitor Cost and Usage
###### COST03-BP05 Configure billing and cost management tools
#### Cost Effective Resources
##### Plan for Data Transfer
###### COST08-BP02 Select components to optimize data transfer cost
this for istio AZ routing
###### COST08-BP03 Implement services to reduce data transfer costs
specifically AZ and regional routing
#### Manage Demand and Supply Resources
##### COST09-BP01 Perform an analysis on the workload demand
need cluster avg usage reporting - related to management node group and any on-demand reserve groups
##### COST09-BP03 Supply resources dynamically
#### Optimize Over Time
##### Automating Operations
###### COST11-BP01 Perform automations for operations
### Sustainability
#### Best Practices for Sustainability in the Cloud
##### Alignment on Demand
###### SUS02-BP01 Scale workload infrastructure dynamically
###### SUS02-BP04 Optimize geographic placement of workloads based on their networking requirements
global accelerator
##### Software Architecture
###### SUS03-BP01 Optimize software and architecture for asynchronous and scheduled jobs
###### SUS03-BP05 Use software patterns and architectures that best support data access and storage patterns
##### Data
###### SUS04-BP02 Use technologies that support data access and storage patterns
opeartors/sql serverless
###### SUS04-BP04 Use elasticity and automation to expand block storage or file system
efs storage class
###### SUS04-BP07 Minimize data movement across networks
istio federation
###### SUS04-BP08 Back up data only when difficult to recreate
not backingup EKS itself, no sources of truth within per se
##### Hardware and Services
###### SUS05-BP03 Use managed services
EKS, etc



## AWS Guidance for EKS

**[Document]**: [EKS Best Practices Guides](https://aws.github.io/aws-eks-best-practices/)  

**Responses**:  

### Security  

AWS is responsible for managing of the EKS managed Kubernetes control plane. This includes the Kubernetes control plane nodes, the ETCD database, and other infrastructure necessary for AWS to deliver a secure and reliable service.  

When it comes to infrastructure security, AWS will assume additional responsibilities as you move from self-managed workers to managed node groups. AWS will also assume responsibility of keeping the EKS optimized AMI up to date with Kubernetes patch versions and security patches. Customers using Managed Node Groups (MNG) are responsible for triggering the upgrade of their Nodegroups to the latest AMI whether through specific action or automatically (such as  when using Karpenter).  

For additional information about the shared responsibility model, see https://aws.amazon.com/compliance/shared-responsibility-model/

#### Security > Identity and Access Management  

##### Don't use a service account token for authentication  

As quoted in the guidance, "At times, you may need to grant an exception for applications that have to consume the Kubernetes API from outside the cluster, e.g. a CI/CD pipeline application."  

The PSK service accounts are used only in the Foundation pipelines. These credentials only have permissions to assume a role, thereby only short-lived credentials are used for all configuration activity. The underlying static credentials are automatically rotated twice monthly.  

##### Employ least privileged access to AWS Resources  

For service accounts, each foundation pipeline uses a role with the necessary permissions. Apart from the platform engineering product team, no other human user has direct aws permissions. Services that interact with AWS managed services use oidc assumable roles created specifically for the service and namespaces via k8s operators.  

##### Use IAM Roles when multiple users need identical access to the cluster  

Apart from the platform engineering product team, no other human user has direct aws permissions.  

##### Employ least privileged access when creating RoleBindings and ClusterRoleBindings  

AuthN for all user access to the cluster is based on an 0auth2/oidc, device auth flow via the Auth0 idp integration. AuthZ is based on membership in onboarded GitHub teams. The platform teams-api manages the creatiaon of all clusterrolebindings for onboarded teams. Teams can self-manage github team membership.  

##### Make the EKS Cluster Endpoint private  

According to AWS, "By default when you provision an EKS cluster, the API cluster endpoint is set to public, i.e. it can be accessed from the Internet. Despite being accessible from the Internet, the endpoint is still considered secure because it requires all API requests to be authenticated by IAM and then authorized by Kubernetes RBAC." Additionally, external access for users is not provided using aws IAM preventing any opportunity for permission escalation.  

##### Create the cluster with a dedicated IAM role  

A dedicated role, not used for any other purpose, is created for the psk-aws-platform-eks-base pipeline.  

##### Use tools to make changes to the aws-auth ConfigMap  

Change to the aws-auth configmap is only made via the lsk-aws-platform-eks-base pipeline using terraform.  

##### Alternative Approaches to Authentication and Access Management  
As noted above, we use an Auth0, oauth2/oidc integration for all User (including admin ) access to the platform.  

##### IAM Roles for Service Accounts (IRSA)
##### Update the aws-node daemonset to use IRSA
##### Restrict access to the instance profile assigned to the worker node
##### Scope the IAM Role trust policy for IRSA to the service account name
##### Disable auto-mounting of service account tokens
##### Use dedicated service accounts for each application
##### Run the application as a non-root user
##### Grant least privileged access to applications
##### Review and revoke unnecessary anonymous access
#### Security > Pod Security
##### Use multiple Pod Security Admission (PSA) modes for a better user experience
##### Restrict the containers that can run as privileged
##### Do not run processes in containers as root
##### Restrict the use of hostPath or if hostPath is necessary restrict which prefixes can be used and configure the volume as read-only
##### Set requests and limits for each container to avoid resource contention and DoS attacks
##### Do not allow privileged escalation
##### Disable ServiceAccount token mounts
##### Disable service discovery
##### Configure your images with read-only root file system
#### Security > Multi-Tenancy
Soft multi-tenancy
##### Kubernetes Constructs
###### Namespaces
###### Network policies
###### Role-based access control (RBAC)
###### Quotas
###### Pod priority and preemption
##### Mitigating controls
###### Open Policy Agent (OPA) & Gatekeeper
###### Isolating tenant workloads to specific nodes
#### Security > Detective Controls
#### Auditing and Logging
##### Enable audit logs

#### Security > Network Security

#### Security > Data Encryption and Secrets Management
#### Security > Runtime Security
#### Security > Infrastructure Security
#### Security > Regulatory Security
#### Security > Incident Response and Forensics
#### Security > Image Security
### Cluster Autoscaling
#### Cluster Autoscaling  Karpenter
### Reliability
#### Reliability > Applications
#### Reliability > Control Plane
#### Reliability > Data Plane
### Windows Containers
### Networking
#### Networking > VPC and Subnet Considerations
#### Networking > Amazon VPC CNI
#### Networking > Prefix Mode for Linux
#### Networking > Prefix Mode for Windows
#### Networking > Running IPv6 Clusters
#### Networking > Security Groups per Pod
#### Networking > Custom Networking
#### Networking > Load Balancing
#### Networking > Monitoring for Network performance issues
### Scalability
#### Scalability > Control Plane
#### Scalability > Data Plane
#### Scalability > Cluster Services
#### Scalability > Workloads
### Cluster Upgrades

