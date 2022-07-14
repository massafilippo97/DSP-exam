# ToDoManager Service

## Overview

This server starts from the solution of LAB03 and extends it in order to implement all the features requested by the exam.

The DB has been extended with the introduction of:

* a new attribute inside the `tasks` table called `completers`, that records the number of users needed in order to complete a task
* a new table called `completion_records`, that collects all the entries of (partial or full) completion of a task done by its assignees.

A series of new and old API endpoints are also used in order to achieve our purpose:

* `​GET /api​/tasks​/{taskId}​/assignees`: it's the same as the one already implemented from LAB03 and it's main job is to retreve the set of users a task (with `taskId`) has been assigned to. Remember that only the `owner` can perform this operation.
* `PUT /api/tasks/{taskId}/completion`: previously, it's main job was to just check if the user was an `assignne` of the task and to eventually perform an update of the task's attribute `completed` to `true`. Now the endpoint also includes the management of the use case on which there could be needed more than one user `completers` in order to complete the task.
In order to do so, the server first goes to insert a new record inside the `completion_records` table of the DB (in order to register the partial completion of the task by the user) and if the total number of records is equal to the `completers` value of the task, the server will also execute the necessary update to the `completed` attribute.
In order to avoid any inconsistencies inside the DB, if the user tries to complete again the same task that has been already marked as partially completed, the server will just return a `403 Forbidden` error.
* `GET /api/tasks/{taskId}/users-selecting`: new endpoint that provides the set of users that currently have the task with `taskId` as selected. This task can only be performed by the `owner` of the task.
* `GET /api/tasks/{taskId}/completion`: new endpoint that returns the current value of the task's attribute `completed` without any other additional info (compared to `GET /api/tasks/{taskId}` that returns instead all the info related to the task). Only the `owner` of the task can execute it.
* `GET /api/tasks/{taskId}/completion/completion-occurrences`: new endpoint that returns the set of users that have already completed the task. If the task is set as completed, then the table `completion_records` of the DB will contain an amount of records equal to the `completers` attribute of the task. Also in this case, only the `owner` is allowed to perform this action.

Some of the other available API endpoints, like `​GET /api​/tasks​/{taskId}​` or `​GET /users/{usersId}/tasks/created`, have been slightly modified in order to manage the introduction of the new attribute `completers` for tasks. The API endpoint `DELETE /api/task/{taskId}` has also been updated in order to also delete all records associated with the task via foreign key relationship (CASCADE DELETE inside the DB structure).

**NOTE:** in order to preserve the consistency of the database in certain possible use cases, by design, once created the task, it is not possible to update the attribute `completers` with the API endpoint `PUT /api/tasks/{taskId}`. The only way to modify its value is to simply remove the task and create a new one with the updated `completers` value.

## Running the server

In order to run the server you must first install all the necessary dependencies with the command `npm install` and then start the application with `npm start` or `nodemon`.
After its short initialization phase, the server will begin to work at the URL `http://localhost:3000/` and it can be fully tested with the tool of your choice (React client, Postman or Swagger).

To view the Swagger UI interface you can connect to the URL `http://localhost:3000/docs`.

In order to fully test the applicaiton, you can use the following credentials:

    - Account ID: 1
    - Username: user.dsp@polito.it
    - Password: password

    - Account ID: 2
    - Username: frank.stein@polito.it
    - Password: shelley97

    - Account ID: 3
    - Username: karen.makise@polito.it
    - Password: fg204v213

    - Account ID: 4
    - Username: rene.regeay@polito.it
    - Password: historia

    - Account ID: 5
    - Username: beatrice.golden@polito.it
    - Password: seagulls

    - Account ID: 6
    - Username: arthur.pendragon@polito.it
    - Password: holygrail
