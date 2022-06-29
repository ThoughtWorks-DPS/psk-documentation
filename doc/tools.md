<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/dps_lab_title.png?sanitize=true" width=350/>
	</p>
  <h3>1.3 A note on tools</h3>
</div>
<br />

![bootstrap](https://img.shields.io/badge/document-EarlyDraft-yellow.svg?style=for-the-badge&logo=markdown)   

Tools are not a neutral component. A chosen tool will either enable or impede architectural and engineering quality.  

Tools are not a strategic capability. TCO includes the opportunity cost of what a team could otherwise be working on. In other words, use SaaS tools wherever architecturally appropriate options exist. Use of a qualified SaaS is one of the most accelerating strategies you can adopt, paying dividends on an ongoing basis.  

The statement, “It’s not about the tools” means only: No tool is going to solve for or remove the impact of your organizational challenges and culture.  

Suitability to IaC lifecycle and a domain-bounded implementation is a prerequisite for all tools and technologies.

### 1.3.1 General tool selection criteria


* Use small, focused tools that are exceptional in their implementation and interoperate well, over monolithic solutions. (One measure of exceptional being an architecture designed clearly to be user-centric, and a roadmap based on real feedback.)  

* Use domain bounded tools and frameworks that can be implemented to enable low-friction changes to higher value alternatives as they become available. (domain-bounded implementation in this case refers to the degree of difficulty in changing the tool when a higher value product comes along. Implement in such a way that the cost to change is relatively low and not a blocker to adoption of alternative technologies.)  

* Prefer solutions offered by qualified SaaS providers over self-managed options, being painfully honest about the actual costs of ownership.  

* Use or implement software that has an API.  
* The API should be easy to use and include functional examples.  
* The API should have all the functionality that the application provides.  
* The API should be accessible by more than one language and platform.  
* Coding around deficiencies in the product should be easier than recreating the product.  

* All data stored in the product should be readable and writeable by other applications.  
* For products that have authentication requirements, they should be able to authenticate and authorize from external, configurable sources. (In particular, they must integrate into the general AuthN/Z scheme of the overall platform, either natively or through custom integration.)

* Place a high value on the depth of community involvement and support.  

### 1.3.2 Tools and technologies used in Lab examples

#### 1.3.2.1 Artifact stores

There are several different types of artifact stores used in the development of a Delivery (or engineering) platform.  

**terraform state**  

Most examples use [terraform cloud](https://www.terraform.io). Access to a quality SaaS terraform state backend addresses a key infrastructure bootstrap challenge for fully software-defined lifecycle management. e.g., you do not need to bootstrap a state store.  

Refer to vendor [documentation](https://www.terraform.io/docs/cloud/index.html) for detailed questions.  

**secrets management**

You will see various secrets-management systems or tools used among the lab environments and working-code examples. Refer to the following documentation sources for detailed information on any particular use case.  

Most examples make use of `1password`.  

- [1password](https://1password.com/products/secrets/))
- [chamber](https://github.com/segmentio/chamber) (aws parameter store)
- [hashi vault](https://www.vaultproject.io)

### specific conventions

**Use of ENVIRONMENT variables in configuration of pipeline tools**  

While pipeline tools are a critical and necessary part of any software-defined system, inappropriate pipeline architectural choices can result in overly complex and brittle systems.  

Environment variables are a key example. While every pipeline orchestration tool provides a built-in mechanism for defining and managing pipeline environment variables, even moderate use of such systems creates a high-friction management lifecycle and increased security risk.  

The only variables defined within the pipeline tool, and thus available at the start of the triggered pipeline, should be the credentials of the pipeline service account. From this starting identity, the pipeline will then interact with the secrets-store or other env-key-store to bring in all other needed environment settings.  

By doing so, pipelines automatically benefit from any credential rotation pattern or events related to environment config. And additionally, the complexity for automating the credentials of the pipelines themselves is continuously constrained.  

_example with 1password and CircleCI_

A circleci `context` is defined that coincides with your github team. All your circleci pipelines reference the context.

The only CircleCI ENV var defined within the context are the OP_CONNECT_URL and OP_CONNECT_TOKEN for the lab 1password vault.  

Now, at the start of any pipeline run, you can inject the credentials for all other pipeline activities or uses of secure config as needed.  

**pipelines**

You will see examples using various well-suited pipeline tools, though chiefly it will be circleci.  

- [**circleci**](https://circleci.com)
- [github actions](https://github.com/features/actions)

**build-artifact stores**

- [**dockerhub**](https://hub.docker.com)  
- [github packages](https://github.com/features/packages)  
- aws elastic container registry  

**code analysis reporting**

- [**codeclimate**](https://codeclimate.com)
- [codacy](https://codacy.com)
- [**snyk**](https://snyk.io)
