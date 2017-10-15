# Alpine Jekyll

[Jekyll](http://jekyllrb.com/) docker image based on Alpine.

Run Jekyll `build` by default, has a `watch` mode and support other jekyll commands.

## How to use
By default the image will run `jekyll build`.

### Minimal configuration
The container needs to have 2 volumes :
- the source directory
- the output directory


    docker run \
        -v <host source directory>:/var/_source/ \
        -v <host output directory>:/var/_site/ \
        cethy/alpine-jekyll:latest

Example usage with a local directory :

    docker run \ 
        -v $PWD/data/source:/var/_source/ \
        -v $PWD/data/_site:/var/_site/ \
        cethy/alpine-jekyll:latest

#### Watch mode

    docker run -ti \
        -v <host source directory>:/var/_source/ \
        -v <host output directory>:/var/_site/ \
        cethy/alpine-jekyll:latest watch

**Note** : `-ti` in watch mode is required to be able to stop the container w/ `ctrl+c`.

##### Other `jekyll` commands

    docker run -ti cethy/alpine-jekyll:latest <help|new|serve|...> <arg1> <...>

Run `help` command or [go to the jekyll documentation](http://jekyllrb.com/docs/home/) for more informations.

**Note** : the env variables (`OUTPUT_DIR`, `INPUT_DIR`, `INPUT_EXTRA_PARAMETERS`) do not impact thoses commands.

### Full configuration

#### default configuration

    docker run \
        -v <host source directory>:/var/_source/ \
        -v <host output directory>:/var/_site/ \
        -e OUTPUT_DIR='/var/_site' \
        -e INPUT_DIR='/var/_source' \
        -e INPUT_EXTRA_PARAMETERS='' \
        cethy/alpine-jekyll:latest

#### Options
##### Build|watch mode
In `build` mode, the container will build the site and exit. 

In `watch` mode, the jekyll script will look for changes in the `INPUT_DIR` and rebuild the site each time.  

|Default|Options|
|:---:|---|
|`build`|`build`|`watch`|


##### `OUTPUT_DIR`

	# default
	-e OUTPUT_DIR='/var/_site'
	
Represents the container output directory.

|Default|Options|
|:---:|---|
|`/var/_source`|\<any container directory\>|

##### `INPUT_DIR`
		
	# default
	-e INPUT_DIR='/var/_source'

Represents the input directory.

|Default|Options|
|:---:|---|
|`/var/_source`|\<any container directory\>|

##### `INPUT_EXTRA_PARAMETERS`
		
	# default
	-e INPUT_EXTRA_PARAMETERS=''

Represents the extra parameters you want to send to the `jekyll` command.

|Default|Options|
|:---:|---|
|-|\<any acceptable `jekyll` parameter\>|

## Customize Jekyll

To add plugins to jekyll, you should :

- clone the repository ;
- edit the Gemfile ;
- `docker build -t my_alpine-jekyll .`

And use your version to build you jekyll websites.

## Misc

### Related work
- WIP Jekyll livereload environment [cethy/jekyll-livereload](https://github.com/Cethy/jekyll-livereload)

