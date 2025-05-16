import { Sequelize } from 'sequelize';
import { User } from './user.model';
import { Profile } from './profile.model';
import { Worker } from './worker.model';
import { UserRole } from './user-role.model';
import { Role } from './role.model';
import { DNS } from "./dns.model";
import { Application } from './application.model';

export const initMySQLModels = (connection: Sequelize) => {
    // init models here
    User.initModel(connection);
    Profile.initModel(connection);
    Worker.initModel(connection);
    Role.initModel(connection);
    UserRole.initModel(connection);
    DNS.initModel(connection);
    Application.initModel(connection);

    // init associations here
    User.initAssociations();
    Profile.initAssociations();
    Worker.initAssociations();
    Role.initAssociations();
    UserRole.initAssociations();
    DNS.initAssociations();
    Application.initAssociations();
};
    