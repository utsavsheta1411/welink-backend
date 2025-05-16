import { Sequelize, Model, DataTypes } from 'sequelize';
export interface endorser {

}

export class Endorser extends Model {
  public id!: string;
  public first_name!: string;
  public last_name!: string;

  static initModel(connection: Sequelize) {
    Endorser.init(
      {
        id: {
          type: DataTypes.STRING(255),
          primaryKey: true,
          defaultValue: DataTypes.UUIDV4,
        },
        version: {
          type: DataTypes.BIGINT,
          defaultValue: 0,
        },
        first_name: {
          type: new DataTypes.STRING(255),
          allowNull: false,
        },
        last_name: {
          type: new DataTypes.STRING(255),
          allowNull: false,
        },
      },
      {
        tableName: "endorser",
        sequelize: connection,
        freezeTableName: true,
        createdAt: "date_created",
        updatedAt: "last_updated",
      }
    );
  }

  static initAssociations() {
    // define association here
  }
}