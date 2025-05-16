import { Sequelize, Model, DataTypes } from "sequelize";

export class DNS extends Model {
  public id!: string;
  public dns!: string;

  static initModel(connection: Sequelize) {
    DNS.init(
      {
        id: {
          type: DataTypes.STRING(255),
          primaryKey: true,
          defaultValue: DataTypes.UUIDV4,
        },
        company_id: {
          type: DataTypes.STRING(255),
          allowNull: false,
        },
        dns: {
          type: DataTypes.STRING(255),
          allowNull: false,
        },
      },
      {
        tableName: "dns",
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
