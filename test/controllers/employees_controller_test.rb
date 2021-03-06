require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manager = Manager.create!(email: 'test@gmail.com', password: 'test123')
    sign_in @manager
    @employee = Employee.create(first_name: 'John', last_name: 'Doe', email: 'test2@gmail.com', slack_id: 'ABCDE', manager: @manager)
  end

  test 'should get index' do
    get employees_url
    assert_response :success
  end

  test 'should get new' do
    get new_employee_url
    assert_response :success
  end

  test 'should create employee' do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { email: @employee.email, first_name: @employee.first_name, last_name: @employee.last_name, slack_id: @employee.slack_id } }
    end
  end

  test 'should show employee' do
    get employee_url(@employee)
    assert_response :success
  end

  test 'should get edit' do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test 'should update employee' do
    patch employee_url(@employee), params: { employee: { email: @employee.email, first_name: @employee.first_name, last_name: @employee.last_name, slack_id: @employee.slack_id } }
    assert_redirected_to employee_url(@employee)
  end

  test 'should destroy employee' do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end

  test 'manager id should equal' do
    assert_equal @manager.id, @employee.manager.id
  end
end
