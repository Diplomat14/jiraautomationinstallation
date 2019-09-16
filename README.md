# JIRA Automation Installation & Usage

### About this repository
This repository contains installation and example scripts for jira automation usage.
It is required as a separate repository while installation from non public repositories is not supporte dby pip.


## Installation
*****

### Preconditions
* Install git
* Install Python with pip

### Installation summary
Intsallation scripts are assumed to be run either from cloned folder as is or from any other folder you would want to copy it. It will create several folders:

- "Dependencies" - all dependencies will be cloned there. Script will install them in local debug mode using pip. You can update afterwards by pulling latest version in that repositories using update scripts.
- "Working" - your customization repository shall be there. Default customization will be cloned there.
- "Output" - used as output directory used by example scripts

### Steps to install
1. Run install.bat
2. Check that all folders are created as described above
3. Check "jiraautomation-main" in console. If command is found and outputs help - installation succeeded


## Usage

### Usage summary
jiraautomation package is installed as "jiraautomation-main". Customization example shows how to install "custjiraautomation-main" command to extend standard commands with customized ones.

Following are key parameters groups to command line:

- connection info (mandatory) - specification of jira connection data
- logging and output info (optional) - specification of log location, debug level
- key operation parameters - selection of operation (mandatory) and result output location (optional)
- operation specific parameetrs - depend on operation. might be mandatory or optional

Typical command line would look like:
jiraautomation-main -s "YOUR_SERVER" -u "USERNAME" -at "ACCESSTOKEN_GOTOYOUR_JIRA_PROFILE" -log "log.txt" -out "data." -o OPERATION -q "SOME_QUERY"

### Preconfigured command line script examples
Script uses jira access token to access system. It can be generated from your JIRA profile here: https://id.atlassian.com/manage/api-tokens . Please update your username and access token in scripts for use. Do not commit changes!

* reportfeatures.bat generates report of features-epics-tasks per sprint
* setduebysprint.bat sets due date for usses using end date of sprint (specified in comman line).
