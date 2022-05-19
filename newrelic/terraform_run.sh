IMPORT_RESOURCE="newrelic_nrql_alert_condition.diskalert"
POCICY_ID="1663644"

function terraimporter() {
    terraform import $IMPORT_RESOURCE $POCICY_ID:$ALERT_RULE:static
    terraform state show $IMPORT_RESOURCE >>1.txt
    terraform state rm $IMPORT_RESOURCE
}

for ALERT_RULE in `cat terraform_policy_condition_Import.txt`;
do
    # Invoke terraformer function
    terraimporter
    echo "Resource for id '$ALERT_RULE' is imported";
done