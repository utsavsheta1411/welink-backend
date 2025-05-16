import { Sequelize, Model, DataTypes } from 'sequelize';
// import { User } from './user.model';

export interface ProfileInfo {
    id: number;
    version: number;
    user_id: string;
    status: string;
    first_name: string;
    last_name: string;
}

export class Profile extends Model {
    public id!: number;
    public version!: number;
    public user_id!: string;
    public status!: string;
    public first_name!: string;
    public last_name!: string;

    static initModel(connection: Sequelize) {
        Profile.init({
            id: {
                type: DataTypes.STRING(255),
                primaryKey: true,
                defaultValue: DataTypes.UUIDV4
            },
            version: {
                type: DataTypes.BIGINT,
                defaultValue: 0
            },
            user_id: {
                type: DataTypes.STRING(255),
                allowNull: false,
            },
            status: {
                type: new DataTypes.STRING(255),
                defaultValue: 'ACTIVE',
                allowNull: false
            },
            first_name: {
                type: new DataTypes.STRING(255),
                allowNull: true
            },
            last_name: {
                type: new DataTypes.STRING(255),
                allowNull: true
            },
        }, {
            tableName: 'profile',
            sequelize: connection,
            freezeTableName: true,
            createdAt: 'date_created',
            updatedAt: 'last_updated'
        });
    }

    static initAssociations() {
        // define association here
    }
}