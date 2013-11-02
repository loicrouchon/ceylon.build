import ceylon.test { assertEquals, test }
import ceylon.build.tasks.ceylon { docCommand }

test void shouldCreateDocCommand() {
    assertEquals{
        expected = "ceylon doc mymodule";
        actual = docCommand {
            ceylon = "ceylon";
            currentWorkingDirectory = null;
            modules = ["mymodule"];
            encoding = null;
            sourceDirectories = [];
            outputRepository = null;
            repositories = [];
            systemRepository = null;
            cacheRepository = null;
            user = null;
            password = null;
            offline = false;
            link = null;
            includeNonShared = false;
            includeSourceCode = false;
            ignoreBrokenLink = false;
            ignoreMissingDoc = false;
            arguments = [];
        };
    };
}

test void shouldCreateDocCommandWithAllParametersSpecified() {
    assertEquals{
        expected = "./ceylon doc --cwd=. --encoding=UTF-8 --source=source-a --source=source-b" +
                " --out=~/.ceylon/repo --rep=dependencies1 --rep=dependencies2 --sysrep=system-repository" +
                " --cacherep=cache-rep --user=ceylon-user --pass=ceylon-user-password --offline" +
                " --link=http://doc.mymodule.org --non-shared --source-code" +
                " --ignore-broken-link --ignore-missing-doc --source=foo --source=bar mymodule1 mymodule2";
        actual = docCommand {
            ceylon = "./ceylon";
            currentWorkingDirectory = ".";
            modules = ["mymodule1", "mymodule2"];
            encoding = "UTF-8";
            sourceDirectories = ["source-a", "source-b"];
            outputRepository = "~/.ceylon/repo";
            repositories = ["dependencies1", "dependencies2"];
            systemRepository = "system-repository";
            cacheRepository = "cache-rep";
            user = "ceylon-user";
            password = "ceylon-user-password";
            offline = true;
            link = "http://doc.mymodule.org";
            includeNonShared = true;
            includeSourceCode = true;
            ignoreBrokenLink = true;
            ignoreMissingDoc = true;
            arguments = ["--source=foo", "--source=bar"];
        };
    };
}
