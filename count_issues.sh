# Please fill in your data and check output and log directories
# You can create access token in your JIA profile https://id.atlassian.com/manage/api-tokens

echo "Due setting bat started"
mkdir -p "output/count_issues"

if [[ ! $1 ]]; then
	QUERY="Sprint is not EMPTY and (duedate is EMPTY or duedate < now()) and assignee = currentUser() and status not in (Closed,Resolved)"
else
	QUERY=$1
fi

jacustomization-main @jira_server.cfg -log "output/count_issues/log.txt" -o CountIssues -q "$QUERY" -sdbsS "YOUR SPRINT 1=2019-1-1,YOUR SPRINT 2=2019-1-14"

echo "Due setting bat finished"