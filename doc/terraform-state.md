<div align="center">
	<p>
		<img alt="CircleCI Logo" src="https://github.com/ThoughtWorks-DPS/lab-documentation/blob/master/doc/img/dps-lab.png?sanitize=true" width="75" />
	</p>
  <h3>ThoughtWorks DPS Lab</h3>
  <h5>2.2 terraform state</h5>
</div>
<br />

![bootstrap](https://img.shields.io/badge/document-EarlyDraft-yellow.svg?style=for-the-badge&logo=markdown)  

DPS lab environments and example code make use of two options as the target backend location for terraform state files.  

### terraform cloud

Most examples use [terraform cloud](https://www.terraform.io). Access to a quality SaaS  terraform state backend addresses the key infrastructure bootstrap challenge for fully software-defined lifecycle management.  

Refer to vendor [documentation](https://www.terraform.io/docs/cloud/index.html) for detailed questions.  

### cloud vendor specific strategies

Terraform supports a variety of cloud-vendor specific backends. Software-defined infrastructure workflows should limit the manual configuration of any cloud vendor accounts to only the minimum state necessary to bootstrap an otherwise software defined configuration.  

See the lab-bootstrap-aws-state for an AWS-based example.  
