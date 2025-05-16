import { Sequelize, Model, DataTypes } from 'sequelize';
import { Profile } from './profile.model';

export interface ApplicationInfo {
    id: string;
    version: number;
    job_id: string;
    date_applied: string;
    applicant_id: string;
}

export class Application extends Model {
    public id!: string;
    public version!: number;
    public date_applied!: string;
    public applicant_id!: string;

    static initModel(connection: Sequelize) {
        Application.init({
            id: {
                type: DataTypes.STRING(255),
                primaryKey: true,
                defaultValue: DataTypes.UUIDV4
            },
            version: {
                type: DataTypes.BIGINT,
                defaultValue: 0
            },
            date_applied: {
                type: DataTypes.STRING(255),
                allowNull: false,
            },
            applicant_id: {
                type: DataTypes.STRING(255),
                allowNull: false,
                references: {
                    model: Profile
                }
            }
        }, {
            tableName: 'application',
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