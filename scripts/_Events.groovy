import java.text.SimpleDateFormat

eventCompileStart = { kind ->
    def buildNumber = metadata.'app.buildNumber'
    def formatter = new SimpleDateFormat("MMM dd, yyyy")
    def buildDate = formatter.format(new Date(System.currentTimeMillis()))
    metadata.'app.buildDate' = buildDate
    metadata.'app.buildProfile' = grailsEnv

    if (!buildNumber)
        buildNumber = 1
    else
        buildNumber = Integer.valueOf(buildNumber) + 1

    metadata.'app.buildNumber' = buildNumber.toString()

    metadata.persist()

    println "**** Compile Starting on Build #${buildNumber}"
}
