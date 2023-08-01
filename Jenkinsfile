pipeline {
  agent any
  parameters{
    string(name:'containername' , description: 'Please enter container name:')
    string(name:'port' , description: 'Enter port of container: ' )
  }
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean package'
      }
      post {
        success {
          echo "Now Archiving the Artifacts...."
          archiveArtifacts artifacts: '**/*.war'
        }
      }
    }  
    stage ('Create Image') {
      steps {
         sh 'docker build . -t tomcatsample'
      }
    }
    stage ('Create container') {
      steps {
        def name = "${params.containername}"
        def port = "${params.port}"
        sh 'docker run -it --name $name -d -p $port:8080 tomcatsample
      }
    }  
  }
}
    
