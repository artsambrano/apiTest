For Eclipse IDE:
1. Select "File" > Select "Maven" > Select "Existing Maven Projects".
2. Locate the apiTest folder to import and click Finish.
3. Locate the java class TestSuitesRunner.java under src/test/java folder (*note: This class will run ALL the tests on ALL folders).
4. Right click and run as JUnit Test. (*note: If a pop-up window for Select Preferred Launcher is displayed, select Eclipse JUnit Launcher).

For Intellij IDE:
1. Import Project > select Import Project from external model > Choose maven.
2. Complete the import process.
3. Locate the java class TestSuitesRunner.java under src/test/java folder (*note: This class will run ALL the tests on ALL folders).
4. Right click and Run TestSuitesRunner.

**Important notes:
To run individual test folder:
1. Run LoginRunner.java for login folder.
2. Run UsersRunner.java for users.
3. Run ValidateUsersRunner.java for validateUsers folder.


