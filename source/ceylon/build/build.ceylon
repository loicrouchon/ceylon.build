import ceylon.collection { HashMap }

shared alias TasksDefinitions => {Entry<Task, {Task*}>*};
shared alias TasksDefinitionsMap => Map<Task, {Task*}>;

shared interface Writer {
    shared formal void info(String message);
    shared formal void error(String message);
    shared default void exception(Exception exception) => error(exception.message);
}

object consoleWriter satisfies Writer {
    
    shared actual void error(String message) {
        print(message);
    }
    
    shared actual void info(String message) {
        process.writeErrorLine(message);
    }
    shared actual void exception(Exception exception) {
        exception.printStackTrace();
    }
}

object exitCode {
    shared Integer success = 0;
    shared Integer dependencyCycleFound = 1;
    shared Integer noTaskToRun = 2;
    shared Integer errorOnTaskExecution = 3;
}

shared void build(TasksDefinitions tasksDefinitions) {
    Integer exitCode = buildTasks(HashMap<Task, {Task*}>(tasksDefinitions), consoleWriter);
    process.exit(exitCode);
}

shared Integer buildTasks(TasksDefinitionsMap tasks, Writer writer) {
    writer.info("## ceylon.build");
    value cycles = analyzeDependencyCycles(tasks);
    if (cycles.empty) {
        value tasksToRun = buildTaskExecutionList(tasks, process.arguments, writer);
        return runTasks(tasksToRun, process.arguments, tasks.keys, writer);
    } else {
        writer.error("# task dependency cycle found between: ``cycles``");
        return exitCode.dependencyCycleFound;
    }
}