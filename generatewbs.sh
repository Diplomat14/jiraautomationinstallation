# Please fill in your data and check output and log directories
# You can create access token in your JIA profile https://id.atlassian.com/manage/api-tokens

echo "WBS Generation sh started"
mkdir -p "output/generatewbs"

jacustomization-main -s "https://DOMAIN.atlassian.net" -u "user@server.com" -at "ACCESSTOKEN_GOTOJIRA_PROFILE" -log "output/generatewbs/log.txt" -o GenerateWBS -q "QUERY_TO_WBS_ROOT_ELEMENTS_DOWN_TO_EPIC" -gwbsEC "Epic Category" -gwbsPERTO "PERT_OPTIMISTIC_FIELD_NAME" -gwbsPERTR "PERT_REALISTIC_FIELD_NAME" -gwbsPERTP "PERT_PESSIMISTIC_FIELD_NAME" -gwbsNWTM "MACRO_GROUP_ISSUE_TYPE=FMG,GROUP_ISSUE_TYPE=FG,HIGH_LEVEL_FEATURE_TYPE=FHLF,FEATURE_TYPE=FBS" -gwbsC2T "components2team.yml"

echo "WBS Generation sh finished"