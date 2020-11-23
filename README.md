## My Project

For my survival analysis project, I will use the data from the Mayo Clinic  trial in primary biliary cirrhosis (PBC) of the liver conducted between 1974 and 1984. The dataset contains a total of 312 PBC patients.

## Execute the analysis using Docker (preferred)

First, you need to download a built Docker image from DockerHub using the command

``` bash
docker pull ainibuni/myproject
```

Or you can build the Docker image locally using the command

``` bash
make build
```

Then you can retrieve the final report from the image using the command

``` bash
docker run -v /localpath/report:/project/output ainibuni/myproject
```

You need to change "/localpath/" to the path to your project directory. This will create a file called `report.html` in the `report` folder.

## Execute the analysis using GNU Make
### Install R packages

To install the packages needed for my analysis, from the project folder you can run

``` bash
make install
```

### Execute the analysis

To execute the analysis, from the project folder you can run

``` bash
make report
```

This will create a file called `report.html` output in your directory that contains the results.

### Makefile help

To get some helpful information about the Makefile, from the project folder you can run

``` bash
make help
```
