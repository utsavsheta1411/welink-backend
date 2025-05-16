import { Sequelize, Model, DataTypes } from 'sequelize';

export interface RoleInfo {
    id: string;
    version: number;
    authority: string;
}

export class Role extends Model {
    public id!: string;
    public version!: number;
    public authority!: string;

    static initModel(connection: Sequelize) {
        Role.init({
            id: {
                type: DataTypes.STRING(255),
                primaryKey: true,
                defaultValue: DataTypes.UUIDV4
            },
            version: {
                type: DataTypes.BIGINT,
                defaultValue: 0
            },
            authority: {
                type: DataTypes.STRING(255),
                allowNull: false,
            }
        }, {
            tableName: 'role',
            sequelize: connection,
            freezeTableName: true,
            timestamps: false
        });
    }

    static initAssociations() {
        // define association here
    }
}