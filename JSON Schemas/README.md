# JSON Schemas

This folder contains all the JSON Schemas used by the Server application plus one object example for each schema.

* **task_schema.json:** represents the structure of a task object and it is strictly used by the server for validation. Compared to the original schema, it was added a new property called `completers` that represents the number of users needed in order to complete the task.
* **user_schema.json:** represents the structure of an user object and it is strictly used by the server for validation. It's wasn't needed to modify it in order to implement the features requested from the exam.
* **completed_schema.json:** represents the structure of the message sent by the server to the client when answering to a GET ``/api/tasks/:taskId/completion`` request. It only contains the `self` and the `completed` attributes in order to fully represent the response to the HTTP GET request mentioned previously.

**NOTE 1:** because some of these JSON schemas are still being used by the Server application, their identical copy is also stored inside the ``ToDoManager Implementation/Server/json_schemas`` folder. 

**NOTE 2:** The only schema that is left outside this folder is the JSON schema `ws_message_schema.json`. The main reason for this is because it's out of scope for the exam (it describes the data structure of websocket messages used by the functionalities introduced with LAB03).
