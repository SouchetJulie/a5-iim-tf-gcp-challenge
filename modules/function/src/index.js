const functions = require('@google-cloud/functions-framework');
const {BigQuery} = require('@google-cloud/bigquery');

const bigquery = new BigQuery({ projectId: process.env.PROJECT_ID });


functions.http('helloHttp', (req, res) => {
  const msg = 'Hello World <3';

  // Add to BigQuery
  bigquery
    .dataset(process.env.BIGQUERY_DATASET)
    .table(process.env.BIGQUERY_TABLE)
    .insert([{msg}])

  // Send HTTP response
  res.send(msg);
});
