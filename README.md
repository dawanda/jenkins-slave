# jenkins-slave

### Introduction

Docker image used by our Jenkins slaves.

### How to Use the Docker Image

Whenever master changes, Jenkins will build the new Docker image.
Have a look [here](https://jenkins.dawanda.in/job/jenkins-slave/).
Once it is successfully built, the Jenkins configuration has to be changed to use it.

##### Steps

1. Go to [Manage Jenkins](https://jenkins.dawanda.in/manage) (It is under the Jenkins main menu)
2. Go to [Configure System](https://jenkins.dawanda.in/configure)
3. Go to the Cloud section of the Configure System page 
4. Click on the `Advanced...` button, then some new fields appear, with another `Advanced...` button, click on this one too.
5. Change the field `Docker image` to have the latest successful build of `jenkins-slave` like so: `docker-registry.dawanda.in/jenkins-slave:build_12345` (`12345` being your build number...)
6. Save changes with the `Save` button (Yep, surprising, isn't it?)
