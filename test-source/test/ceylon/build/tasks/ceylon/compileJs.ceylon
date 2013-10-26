import ceylon.test { assertEquals, test }
import ceylon.build.tasks.ceylon { buildCompileJsCommand }

test void shouldCreateCompileJsCommand() {
    assertEquals{
        expected = "ceylon compile-js mymodule";
        actual = buildCompileJsCommand {
            ceylon = "ceylon";
            compilationUnits = ["mymodule"];
            encoding = null;
            sourceDirectories = [];
            outputModuleRepository = null;
            dependenciesRepository = null;
            systemRepository = null;
            user = null;
            password = null;
            offline = false;
            compact = false;
            noComments = false;
            noIndent = false;
            noModule = false;
            optimize = false;
            profile = false;
            skipSourceArchive = false;
            verbose = false;
            arguments = [];
        };
    };
}

test void shouldCreateCompileJsCommandWithAllParametersSpecified() {
    assertEquals{
        expected = "./ceylon compile-js --encoding=UTF-8 --src=source-a --src=source-b" +
                " --out=~/.ceylon/repo --rep=dependencies --sysrep=system-repository" +
                " --user=ceylon-user --pass=ceylon-user-password --offline --compact" +
                " --no-comments --no-indent --no-module --optimize --profile" +
                " --skip-src-archive --verbose --src=foo --src=bar mymodule file1.js file2.js";
        actual = buildCompileJsCommand {
            ceylon = "./ceylon";
            compilationUnits = ["mymodule", "file1.js", "file2.js"];
            encoding = "UTF-8";
            sourceDirectories = ["source-a", "source-b"];
            outputModuleRepository = "~/.ceylon/repo";
            dependenciesRepository = "dependencies";
            systemRepository = "system-repository";
            user = "ceylon-user";
            password = "ceylon-user-password";
            offline = true;
            compact = true;
            noComments = true;
            noIndent = true;
            noModule = true;
            optimize = true;
            profile = true;
            skipSourceArchive = true;
            verbose = true;
            arguments = ["--src=foo", "--src=bar"];
        };
    };
}
