#!/usr/bin/perl

$YAML_TAB = '  ';
$PRESETS_DIR = 'presets';
$TASKS_DIR = 'tasks';

open (CONFIG_FILE, '>config.yml') or die "Cannot open config file: $!";


###
#Presets
###
print CONFIG_FILE "presets:\n";

opendir $presets, $PRESETS_DIR or die "Couldn't open presets directory: $!";
@presetFiles = readdir $presets;
closedir $presets;

foreach $presetFile(@presetFiles) {
	my $presetName = $presetFile =~ s/\.yml//g;
	print CONFIG_FILE, $YAML_TAB . $presetName . ":\n";
	
	open (PRESET_FILE, $PRESETS_DIR . '/' .$presetFile) or die "Cannot open preset file $presetFile: $!";
	
	while(<PRESET_FILE>) {
		print CONFIG_FILE, ($YAML_TAB x 2) . $_;
	}
	
	close (PRESET_FILE);
}

###
# Tasks
###
print CONFIG_FILE "tasks:\n";

opendir $tasks, $TASKS_DIR or die "Couldn't open tasks director: $!";
@taskFiles = readdir $tasks;
closedir $tasks;

foreach $taskFile(@taskFiles) {
	my $taskName = $taskFile =! s/\.yml//g;
	print CONFIG_FILE, $YAML_TAB . $taskName . ":\n";
	
	open (TASK_FILE, $TASKS_DIR . '/' . $taskFile) or die "Cannot open task file $taskFile: $!";
	
	while(<TASK_FILE>) {
		print CONFIG_FILE, ($YAML_TAB x 2) . $_;
	}
	
	close (TASK_FILE);
}

close(CONFIG_FILE);