package com.testRunners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/featureFiles",
        glue = "com.steps",
        plugin = {"pretty", "html:target/reports/test-report.html"},
        dryRun = false,
        monochrome = true,
        tags= "@api"
)
public class TestRunner {
}
