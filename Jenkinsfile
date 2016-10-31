docker.image('jenkins-ubuntu-1604').inside {
    stage 'Clean before build'
    sh 'rm -rf .[^.] .??* *'

    stage 'Checkout'
    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, recursiveSubmodules: true, reference: '', trackingSubmodules: false]], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/muhkuh-sys/org.luajit-bitop.git']]])

    stage 'Bootstrap'
    sh 'sudo apt-get --quiet --assume-yes update'
    sh 'sudo apt-get --quiet --assume-yes install ant cmake3 make mingw-w64-mbs'
    sh './.build00_install_build_requirements.sh'

    stage 'Build Windows32'
    sh 'PATH=/usr/mingw-w64-i686/bin:/usr/mingw-w64-x86_64/bin:${PATH} ./.build01_windows32.sh'

    stage 'Build Windows64'
    sh 'PATH=/usr/mingw-w64-i686/bin:/usr/mingw-w64-x86_64/bin:${PATH} ./.build02_windows64.sh'

    stage 'Assemble Artifacts'
    sh './.build03_assemble_artifact.sh'

    stage 'Archive artifacts'
    archive 'build/bitop-*.zip,build/bitop.zip,build/ivy-*.xml,build/ivy.xml,build/pom.xml'

    stage 'Clean after build'
    sh 'rm -rf .[^.] .??* *'
}
