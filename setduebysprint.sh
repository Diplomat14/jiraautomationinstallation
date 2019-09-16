# Please fill in your data and check output and log directories
# You can create access token in your JIA profile https://id.atlassian.com/manage/api-tokens

echo "Due setting bat started"
mkdir -p "output/setduebysprint"

if [[ ! $1 ]]; then
	QUERY="Sprint is not EMPTY and (duedate is EMPTY or duedate < now()) and assignee = currentUser() and status not in (Closed,Resolved)"
else
	QUERY=$1
fi

jacustomization-main -s "https://DOMAIN.atlassian.net" -u "user@server.com" -at "ACCESSTOKEN_GOTOYOUR_JIRA_PROFILE" -log "output/setduebysprint/log.txt" -o SetDueBySprint -q "$QUERY" -sdbsS "YOUR SPRINT 1=2019-1-1,YOUR SPRINT 2=2019-1-14"

echo "Due setting bat finished"