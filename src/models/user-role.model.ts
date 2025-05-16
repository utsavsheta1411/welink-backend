import { Sequelize, Model, DataTypes } from "sequelize";
import { User } from "./user.model";
import { Role } from "./role.model";

export interface UserRoleInfo {
  user_id: string;
  role_id: string;
}

export class UserRole extends Model {
  public user_id!: string;
  public role_id!: string;

  static initModel(connection: Sequelize) {
    UserRole.init(
      {
        user_id: {
          type: DataTypes.STRING(255),
          allowNull: false,
          primaryKey: false,
          references: {
            model: User,
            key: "id",
          },
        },
        role_id: {
          type: DataTypes.STRING(255),
          allowNull: false,
          primaryKey: false,
          references: {
            model: Role,
            key: "id",
          },
        },
        id: {
          type: DataTypes.STRING(255),
          primaryKey: true,
          defaultValue: DataTypes.UUIDV4,
        },
      },
      {
        tableName: "user_role",
        sequelize: connection,
        freezeTableName: true,
        timestamps: false,
      }
    );
  }

  static initAssociations() {
    // define association here
    // UserRole.belongsTo(Role, { foreignKey: { name: 'role_id', allowNull: false } });
    // UserRole.belongsTo(User, { foreignKey: { name: 'user_id', allowNull: false } });
  }
}
