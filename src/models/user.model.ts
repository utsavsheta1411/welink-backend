import { Sequelize, Model, DataTypes } from 'sequelize';
import { UserRole } from './user-role.model';

export interface UserInfo {
    id: string;
    version: number;
    password_expired: boolean;
    account_expired: boolean;
    account_locked: boolean;
    tenant_id: string;
    username: string;
    email_address: string;
    password: string;
    enabled: boolean;
}

export class User extends Model {
    public id!: string;
    public version!: number;
    public password_expired!: boolean;
    public account_expired!: boolean;
    public account_locked!: boolean;
    public tenant_id!: string;
    public username!: string;
    public email_address!: string;
    public password!: string;
    public enabled!: boolean;

    static initModel(connection: Sequelize) {
        User.init({
            id: {
                type: DataTypes.STRING(255),
                primaryKey: true,
                defaultValue: DataTypes.UUIDV4
            },
            version: {
                type: DataTypes.BIGINT,
                defaultValue: 0
            },
            password_expired: {
                type: DataTypes.BOOLEAN,
                defaultValue: false
            },
            account_expired: {
                type: DataTypes.BOOLEAN,
                defaultValue: false
            },
            account_locked: {
                type: DataTypes.BOOLEAN,
                defaultValue: false
            },
            tenant_id: {
                type: new DataTypes.STRING(255),
                defaultValue: '77c97464-8677-4d92-9bee-3d4293cc4b14'
            },
            username: {
                type: new DataTypes.STRING(255),
                allowNull: false
            },
            email_address: {
                type: new DataTypes.STRING(255),
                allowNull: false
            },
            password: {
                type: new DataTypes.STRING(255),
                allowNull: false
            },
            enabled: {
                type: new DataTypes.BOOLEAN,
                defaultValue: true
            }
        }, {
            tableName: 'users',
            sequelize: connection,
            freezeTableName: true,
            createdAt: 'date_created',
            updatedAt: 'last_updated'
        });
    }

    static initAssociations() {
        // define association here
        // User.hasOne(UserRole, { foreignKey: 'user_id' });
    }
}