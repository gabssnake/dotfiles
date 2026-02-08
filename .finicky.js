// https://finicky-kickstart.now.sh to generate configuration
// https://github.com/johnste/finicky/wiki/Configuration
// https://github.com/johnste/finicky/wiki/Configuration-ideas

module.exports = {
  defaultBrowser: "Safari",
  handlers: [
    {
      browser: "Island",
      match: [
        "forms.gle",
        "mixpanel.com",
        "metabaseapp.com",
        "claude.com",
        "clau.de",
        "app.sli.do",
        "amazon.com",
        "loom.com",
        "atlan.com",
        "atlassian.com",
        "atlassian.net",
        "bamboohr.com",
        "calamari.io",
        "cirrus-ci.com",
        "1password.com",
        "cursor.com",
        "cursor.sh",
        "figma.com",
        "force.com",
        "forticloud.com",
        "fortinet.com",
        "fullstory.com",
        "github.com",
        "github.com/SonarSource",
        "google.com",
        "jfrog.io",
        "jumpcloud.com",
        "kontent.ai",
        "launchdarkly.com",
        "lever.co",
        "lucid.app",
        "navan.com",
        "netlify.app",
        "productboard.com",
        "salesforce.com",
        "salesloft.com",
        "sc-dev19.io",
        "sc-staging.io",
        "service-now.com",
        "slack.com",
        "sonarcloud.io",
        "sonarqube.com",
        "sonarsource.com",
        "sprig.com",
        "tableau.com",
        "trello.com",
        "uniflowonline.com",
        "usertesting.com",
        "vimeo.com",
        "youtube.com",
        "zoom.us",
      ].map(domain)
    }
  ]
}

function domain(name) {
  return new RegExp(name.replaceAll(".", "\."))
}
