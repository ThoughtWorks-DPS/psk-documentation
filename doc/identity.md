<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/>
	</p>
  <h3>1.2 Identity and auth</h3>
</div>
<br />

![bootstrap](https://img.shields.io/badge/document-EarlyDraft-yellow.svg?style=for-the-badge&logo=markdown)  

Generally, identity and authorization is a _solve-for-first_ issue.  

If you are going to deliver a self-serve experience for internal consumers of a delivery infrastructure platform, how will you enable those internal teams to self manage team creation and membership? When a team adds a team membership, how will that team member automatically have access to all of the team resources?  

The Platform Starter Kit integrates Github and Github Teams information as AuthN and AuthZ, respectively. It is assumed that internal customers will already have been granted access to the company's github organization and can self-manage team creation and membership. Using a Platform touchpoint (CLI, Developer Portal), internal customers can on-board their github team and automatically inherit this team-leveal authZ across all Platform resources.  

DPS lab environments and working code examples make use of identity provider services for oauth2 workflows. The primary services are highlighted.

- [**auth0**](https:/auth0.com)
- [okta](https://okta.com)
