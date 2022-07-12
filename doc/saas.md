<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/>
	</p>
  <h3>2.3 pipelines and artifact stores</h3>
</div>
<br />

![bootstrap](https://img.shields.io/badge/document-EarlyDraft-yellow.svg?style=for-the-badge&logo=markdown)   

DPS lab environments and working code examples make use of the following pipeline tools and artifacts stores. The primary services are highlighted.

### pipelines

- [**circleci**](https://circleci.com)
- [github actions](https://github.com/features/actions)
- [buildkite](https://buildkite.com) (_pending_)

#### circleci executors and orbs

_executors_  
[circleci-remote-docker](https://github.com/ThoughtWorks-DPS/circleci-remote-docker)  
[circleci-base-image](https://github.com/ThoughtWorks-DPS/circleci-base-iamge)  
[circleci-executor-builder](https://github.com/ThoughtWorks-DPS/circleci-executor-builder)  
[circleci-infra-aws](https://github.com/ThoughtWorks-DPS/circleci-infra-aws)  
[circleci-kube-ops](https://github.com/ThoughtWorks-DPS/circleci-kube-ops)  

_orbs_  
[twdps/orb-tools](https://github.com/ThoughtWorks-DPS/orb-tools)  
[twdps/executor-tools](https://github.com/ThoughtWorks-DPS/orb-executor-tools)  
[twdps/terraform](https://github.com/ThoughtWorks-DPS/orb-terraform)  
[twdps/kube-ops](https://github.com/ThoughtWorks-DPS/orb-kube-ops)  

#### github runners and actions  

_actions_  
[terraform-action](https://github.com/ThoughtWorks-DPS/terraform-action)  
[lab-runner-setup-action](https://github.com/ThoughtWorks-DPS/lab-runner-setup-action)  

### artifact stores

- [**dockerhub**](https://hub.docker.com)  
- [github packages](https://github.com/features/packages)  
- aws elastic container registry  

### code analysis

- [**codeclimate**](https://codeclimate.com)
- [codacy](https://codacy.com)
- [**snyk**](https://snyk.io)
