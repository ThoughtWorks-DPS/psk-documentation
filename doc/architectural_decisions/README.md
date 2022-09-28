<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/>
	</p>
  <h3>Architectural Decision Record</h3>
</div>
<br />

The top-level Platform Starter Kit architectural decision records are maintained in this lab-documentation. Individual repositories may also contain capability-specific ADRs.  

#### Adding Decision Records (for platform starter kit maintainers)

The lab-documentation architectural decision records are maintained using [adr-tools](https://github.com/npryce/adr-tools). After you have installed the tool locally you may:  

Create ADRs

```bash
adr new Use python package pre-commit for managing git precommit hooks
```

Create an ADR that supercedes a previous decision  

```bash
adr new -s 9 Use Go in the creation of platform command line tools
```

For further information, use the built in help:
```bash
adr help
```