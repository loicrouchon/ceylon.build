import ceylon.test { assertEquals, test }
import ceylon.build.tasks.ceylon { buildRunJsCommand }

test void shouldCreateRunJsCommand() {
    assertEquals{
        expected = "ceylon run-js mymodule/1.0.0";
        actual = buildRunJsCommand {
            ceylon = "ceylon";
            moduleName = "mymodule";
            version = "1.0.0";
            offline = false;
            repositories = [];
            systemRepository = null;
            functionNameToRun = null;
            debug = null;
            pathToNodeJs = null;
            arguments = [];
        };
    };
}

test void shouldCreateRunJsCommandWithAllParametersSpecified() {
    assertEquals{
        expected = "./ceylon run-js --offline --rep=dependencies1 --rep=dependencies2 --sysrep=system-repository" +
                " --run=main --debug=debug --node-exe=/usr/bin/nodejs mymodule/0.1 --foo bar=toto";
        actual = buildRunJsCommand {
            ceylon = "./ceylon";
            moduleName = "mymodule";
            version = "0.1";
            offline = true;
            repositories = ["dependencies1", "dependencies2"];
            systemRepository = "system-repository";
            functionNameToRun = "main";
            debug = "debug";
            pathToNodeJs = "/usr/bin/nodejs";
            arguments = ["--foo", "bar=toto"];
        };
    };
}
