Hooks
=====

The project was created to simplify the synchronization of branches of various repositories between **gitlab** and **bitbucket**, using Webhooks.

##### The principle of interaction

Gitlab and Bitbucket are configured to send requests (JSON) to the synchronization server:

**http://hooks.dev6.icontextdev.ru**

```
Notes: in one request, all branches of the repository are checked, in order to avoid desynchronization
```

### Repository synchronization:

- repository search;
- reading local branches of each repository: **Gitlab**, **BitBucket**;
- pulling together the changes of each branch and writing to the consolidated repository;
- determination of which storage the synchronization request came from;
- depending on the storage, writes are made to the opposite:
- from **Gitlab** to **BitBucket**
   - from **BitBucket** to **Gitlab**


### Setup

- Each repository must be configured individually, from the folder **../hooks/repos/**;
    
    For example:
    
    ```
       git remote add bitbucket git@bitbucket.org:icontext/istat.git
    ```
    ```
       git remote add gitlab git@gitlab.icontextdev.ru:cabinet/cabinet.git
    ```
    
    Dependencies for the project work:
    * git
    * php 7.2
    * nginx
    * composer
        
**Ability to use synchronization from the command line:**

```
./sync.sh "repo_name" "host"
```

**repo_name** - repository name

**host** - **bitbucket.org ** or **gitlab.icontextdev.ru**

#### Installation and Configuration

** Important! You must specify the path to the folder where the repositories will be stored**

- run the installer with the parameter:

```
./install.sh /var/www/hooks/var/repos/
```
