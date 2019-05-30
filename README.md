#Algunos tips para Terraform:

#Establecer variablaes de entorno para nuestras credenciales en GCP.
1- export GOOGLE_CLOUD_KEYFILE_JSON="/home/sxa391/.gcp/credentials"
  1.1- En directorio indicado, crear el archivo credentials con las credenciales correspondientes:
2- export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CLOUD_KEYFILE_JSON
