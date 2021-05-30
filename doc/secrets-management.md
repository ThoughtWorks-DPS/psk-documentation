<div align="center">
  <p>
    <img alt="CircleCI Logo" src="https://github.com/ThoughtWorks-DPS/lab-documentation/blob/master/doc/img/dps-lab.png?sanitize=true" width="75" />
  </p>
  <h3>ThoughtWorks DPS Lab</h3>
  <h5>2.1 secrets management</h5>
</div>
<br />
![bootstrap](https://img.shields.io/badge/document-EarlyDraft-yellow.svg?style=flat)  

You will see various secrets-management systems or tools used among the lab environments and working-code examples. Refer to the following documentation sources for detailed information on any particular use case.  

Most examples make use of `secrethub`. Nearly every facet of this product envisions use in the context of software delivery, and focuses on that primary customer.  

- [secrethub.io](https://secrethub.io)
- [chamber](https://github.com/segmentio/chamber) (aws parameter store)
- [hashi vault](https://www.vaultproject.io)

### specific conventions

**Use of ENVIRONMENT variables in configuration of pipeline tools**  

While pipeline tools are a critical and necessary part of any software-defined system, inappropriate pipeline architectural choices can result in overly complex and brittle systems.  

Environment variables are a key example. While every pipeline orchestration tool provides a built-in mechanism for defining and managing pipeline environment variables, even moderate use of such systems creates a high-friction management lifecycle and increased security risk.  

The only variables defined within the pipeline tool, and thus available at the start of the triggered pipeline, should be the credentials of the pipeline service account. From this starting identity, the pipeline will then interact with the secrets-store or other env-key-store to bring in all other needed environment settings.  

By doing so, pipelines automatically benefit from any credential rotation pattern or events related to environment config. And additionally, the complexity for automating the credentials of the pipelines themselves is continuously constrained.  

_example with secrethub and CircleCI_

A circleci `context` is defined that coincides with your github team. All your circleci pipelines reference the context.

The only CircleCI ENV var defined within the context is the SECRETHUB_CREDENTIAL for your team's secrethub-sa.  

Now, at the start of any pipeline run, you can inject the credentials for all other pipeline activities or uses of secure config as needed.  
