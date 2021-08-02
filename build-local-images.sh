echo "@-@-@-@-@-@-@  B U I L D I N G   L O C A L   D O C K E R   I M A G E S  @-@-@-@-@-@-@"
eval $(minikube -p minikube docker-env)
HOME_DIR=`pwd`

cd $HOME_DIR/openidl-data-call-app
echo "****** Inside ... " `pwd`
. ./build-image.sh

cd $HOME_DIR/openidl-data-call-processor
echo "****** Inside ... " `pwd`
. ./build-image.sh

cd $HOME_DIR/openidl-insurance-data-manager
echo "****** Inside ... " `pwd`
. ./build-image.sh

cd $HOME_DIR/openidl-ui
echo "****** Inside ... " `pwd`
. ./build-image.sh

echo "run this command to load the images 'make reinstall_in_k8s', ensure images are not in use before running the command."