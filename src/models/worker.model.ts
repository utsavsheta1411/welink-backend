import { Sequelize, Model, DataTypes } from 'sequelize';
import { Profile } from './profile.model';

export interface WorkerInfo {
    id: string;
    version: number;
    profile_id: string;
}

export class Worker extends Model {
    public id!: string;
    public version!: number;
    public profile_id!: string;

    static initModel(connection: Sequelize) {
        Worker.init({
            id: {
                type: DataTypes.STRING(255),
                primaryKey: true,
                defaultValue: DataTypes.UUIDV4
            },
            version: {
                type: DataTypes.BIGINT,
                defaultValue: 0
            },
            profile_id: {
                type: DataTypes.STRING(255),
                allowNull: false,
                references: {
                    model: Profile
                }
            }
        }, {
            tableName: 'worker',
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